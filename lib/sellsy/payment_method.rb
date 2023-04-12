# frozen_string_literal: true

module Sellsy
  class PaymentMethod < Singular
    def collection_path
      'payments/methods'
    end
  end
end
