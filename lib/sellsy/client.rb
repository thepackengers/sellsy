# frozen_string_literal: true

module Sellsy
  class Client
    API_BASE  = URI 'https://api.sellsy.com/v2/'
    API_V1_BASE  = URI 'https://apifeed.sellsy.com/0/'
    AUTH_BASE = URI 'https://login.sellsy.com/oauth2/'

    def self.default
      @default ||= new(
        client_id: Sellsy.default_client_id,
        client_secret: Sellsy.default_client_secret
      )
    end

    def initialize(client_id:, client_secret:)
      @id = client_id
      @secret = client_secret
    end

    def get(path, base: API_BASE)
      parse_response(Net::HTTP.get_response(
        base + path,
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{access_token}"
      ))
    end

    def post(path, body:, base: API_BASE)
      _post(path, body: body, base: base,
            headers: { "Authorization" => "Bearer #{access_token}" })
    end

    def post_v1(method, body:, base: API_V1_BASE)
      request = Net::HTTP::Post.new(base.request_uri)

      request.set_form_data(
        request: 1,
        io_mode: :json,
        do_in: { method: method, params: body }.to_json
      )
      request["Authorization"] = "Bearer #{access_token}"

      parse_response(
        Net::HTTP.start(base.hostname, use_ssl: true) do |http|
          http.request(request)
        end
      )
    end

    def inspect
      vars = [:@id].map { |n| "#{n}=#{instance_variable_get(n).inspect}" }

      "#<%s:0x%x %s>" % [self.class,__id__,vars.join(', ')]
    end

    def invoices
      Sellsy::Invoices.new(self)
    end

    def companies
      Sellsy::Companies.new(self)
    end

    def individuals
      Sellsy::Individuals.new(self)
    end

    def document_models
      Sellsy::DocumentModels.new(self)
    end

    def taxes
      Sellsy::Taxes.new(self)
    end

    def get_infos
      Sellsy::V1::GetInfos.new(self)
    end

    def document_create
      Sellsy::V1::DocumentCreate.new(self)
    end

    def get_currencies
      Sellsy::V1::GetCurrencies.new(self)
    end

    def get_doc_layouts
      Sellsy::V1::GetDocLayouts.new(self)
    end

    def get_pay_mediums
      Sellsy::V1::GetPayMediums.new(self)
    end

    def get_translation_languages
      Sellsy::V1::GetTranslationLanguages.new(self)
    end

    def get_units
      Sellsy::V1::GetUnits.new(self)
    end

    private

    attr_reader :id, :secret

    Authorization = Struct.new(
      :token_type, :expires_in, :access_token, :refresh_token,
      keyword_init: true
    )

    def access_token
      @access_token ||= begin
        payload = {
          grant_type:    :client_credentials,
          client_id:     id,
          client_secret: secret
        }

        response = _post('access-tokens', body: payload, base: AUTH_BASE)

        Authorization.new(response).access_token
      end
    end

    def _post(path, body:, base:, headers: {})
      parse_response(Net::HTTP.post(
        base + path, body.to_json,
        { "Content-Type" => "application/json" }.merge(headers)
      ))
    end

    def parse_response(response)
      if response.kind_of?(Net::HTTPSuccess)
        JSON.parse(response.body).transform_keys(&:to_sym)
      else
        raise Sellsy::Error.new(
          "#{response.code} - #{response.message} - #{error_message(response)}",
          response
        )
      end
    end

    def error_message(response)
      if response['Content-Type'] == "application/json"
        error = JSON.parse(response.body)
        error['message'] || error.dig('error', 'message')
      else
        response.body[0..500]
      end
    end
  end
end
