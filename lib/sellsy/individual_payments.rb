# frozen_string_literal: true

module Sellsy
  class IndividualPayments < Collection
    def initialize(client, individual)
      super(client)

      @individual = individual
    end

    def build(data)
      singular_class.new(client, @individual, data)
    end

    def path
      "#{@individual.path}/payments"
    end

    def singular_class
      IndividualPayment
    end
  end
end
