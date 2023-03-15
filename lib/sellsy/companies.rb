# frozen_string_literal: true

module Sellsy
  class Companies < Collection
    def path
      'companies'
    end

    def singular_class
      Company
    end
  end
end
