# frozen_string_literal: true

module Sellsy
  class CompanyAddress < Singular
    def initialize(client, company, data)
      super(client, data)

      @company = company
    end

    def collection_path
      "#{@company.path}/addresses"
    end
  end
end
