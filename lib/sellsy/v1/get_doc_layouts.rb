# frozen_string_literal: true

module Sellsy
  module V1
    class GetDocLayouts < Base
      def call(body = {})
        client.post_v1('Accountdatas.getDocLayouts', body: body)
      end
    end
  end
end
