# frozen_string_literal: true

module Sellsy
  class Collection < Base
    attr_reader :client, :data

    def create(data)
      build(client.post(path, body: data.to_json))
    end

    def build(data)
      singular_class.new(client, data)
    end

    def get(id)
      build(id: id).tap(&:fetch)
    end

    def list
      build_results(client.get(path))
    end

    def search(params = { filters: [] })
      build_results(client.post(path + '/search', body: params.to_json))
    end

    private

    def build_results(response)
      data = response[:data]

      {
        results: data.map { |resource| build(resource.transform_keys(&:to_sym)) },
        pagination: response[:pagination]
      }
    end

    def singular_class
      Object.const_get(self.class.name[0..-2])
    end
  end
end
