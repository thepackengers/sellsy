# frozen_string_literal: true

module Sellsy
  module V1
    class DocumentValidate < Base
      def call(body = {})
        client.post_v1('Document.validate', body: body)
      end
    end
  end
end
