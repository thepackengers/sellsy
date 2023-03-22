# frozen_string_literal: true

module Sellsy
  module V1
    class GetTranslationLanguages < Base
      def call(body = {})
        client.post_v1('Accountdatas.getTranslationLanguages', body: body)
      end
    end
  end
end
