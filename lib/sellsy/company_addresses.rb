# frozen_string_literal: true

module Sellsy
  class CompanyAddresses < Collection
    def initialize(client, company)
      super(client)

      @company = company
    end

    def path
      "#{@company.path}/addresses"
    end

    def singular_class
      CompanyAddress
    end
  end
end
