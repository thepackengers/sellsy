# frozen_string_literal: true

module Sellsy
  module V1
    class GetPayMediums < Base
      def call(body = {})
        client.post_v1('Accountdatas.getPayMediums', body: body)
      end
    end
  end
end
