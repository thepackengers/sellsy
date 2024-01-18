# frozen_string_literal: true

module Sellsy
  module V1
    class DocumentUpdateStep < Base
      def call(body = {})
        client.post_v1('Document.updateStep', body: body)
      end
    end
  end
end
