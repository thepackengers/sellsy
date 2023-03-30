# frozen_string_literal: true

module Sellsy
  class CreditNotes < Collection
    def path
      'credit-notes'
    end

    def singular_class
      CreditNote
    end
  end
end
