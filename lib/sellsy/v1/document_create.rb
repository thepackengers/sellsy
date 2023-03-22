# frozen_string_literal: true

module Sellsy
  module V1
    class DocumentCreate < Base
      def call(body = {})
        client.post_v1('Document.create', body: body)
      end
    end
  end
end
