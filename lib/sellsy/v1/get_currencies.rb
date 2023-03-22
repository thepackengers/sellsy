# frozen_string_literal: true

module Sellsy
  module V1
    class GetCurrencies < Base
      def call(body = {})
        client.post_v1('AccountPrefs.getCurrencies', body: body)
      end
    end
  end
end
