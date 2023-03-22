# frozen_string_literal: true

module Sellsy
  class Invoice < Singular
    def collection_path
      'invoices'
    end

    def validate(body = {})
      client.post("#{path}/validate", body: body)
    end
  end
end
