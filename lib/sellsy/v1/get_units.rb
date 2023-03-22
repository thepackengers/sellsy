# frozen_string_literal: true

module Sellsy
  module V1
    class GetUnits < Base
      def call(body = {})
        client.post_v1('Accountdatas.getUnits', body: body)
      end
    end
  end
end
