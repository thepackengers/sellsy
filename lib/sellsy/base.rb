# frozen_string_literal: true

module Sellsy
  class Base
    attr_reader :client

    def initialize(client)
      @client = client
    end
  end
end
