# frozen_string_literal: true

module Sellsy
  class Company < Singular
    def collection_path
      'companies'
    end

    def addresses
      CompanyAddresses.new(client, self)
    end
end
end
