# frozen_string_literal: true

module Sellsy
  class GetInfos < Base
    def call(body = {})
      client.post_v1('Infos.getInfos', body: body)
    end
  end
end
