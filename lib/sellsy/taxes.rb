# frozen_string_literal: true

module Sellsy
  class Taxes < Collection
    def path
      "taxes"
    end

    def singular_class
      Tax
    end
  end
end
