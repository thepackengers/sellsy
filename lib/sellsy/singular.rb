# frozen_string_literal: true

module Sellsy
  class Singular < Base
    extend Forwardable

    attr_reader :data
    def_delegators :@data, :id

    def initialize(client, data)
      super(client)

      @data = build(data)
    end

    def fetch
      @data = build(client.get(path))
    end

    def path
      "#{collection_path}/#{id}"
    end

    def update
      raise 'TODO'
    end

    def delete
      raise 'TODO'
    end

    private

    def build(data)
      # TODO: do not define an getter if a method with the same name is already defined.
      self.class.def_delegators :@data, *data.keys

      Struct.new(*data.keys).new(*data.values)
    end
  end
end
