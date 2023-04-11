# frozen_string_literal: true

module Sellsy
  class IndividualPayment < Singular
    def initialize(client, individual, data)
      super(client, data)

      @individual = individual
    end

    def collection_path
      "#{@individual.path}/payments"
    end
  end
end
