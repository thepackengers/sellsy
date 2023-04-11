# frozen_string_literal: true

module Sellsy
  class Individual < Singular
    def collection_path
      "individuals"
    end

    def addresses
      IndividualAddresses.new(client, self)
    end

    def payments
      IndividualPayments.new(client, self)
    end
  end
end
