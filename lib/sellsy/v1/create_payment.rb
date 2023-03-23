# frozen_string_literal: true

module Sellsy
  module V1
    class CreatePayment < Base
      def call(body = {})
        client.post_v1('Document.createPayment', body: body)
      end
    end
  end
end
