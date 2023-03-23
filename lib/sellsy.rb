require "sellsy/version"

module Sellsy
  class Error < StandardError
    attr_reader :response

    def initialize(message, response)
      super(message)

      @response = response
    end
  end

  class << self
    extend Forwardable

    attr_accessor :default_client_id, :default_client_secret

    # v2
    def_delegators :client, :invoices, :companies, :individuals,
                   :document_models, :taxes

    # v1
    def_delegators :client, :get_infos, :document_create, :get_currencies,
                   :get_doc_layouts, :get_pay_mediums, :get_translation_languages,
                   :get_units, :create_payment

    def client
      Client.default
    end
  end
end

require 'sellsy/client'

require 'sellsy/base'
require 'sellsy/singular'
require 'sellsy/collection'

require 'sellsy/company'
require 'sellsy/companies'
require 'sellsy/company_address'
require 'sellsy/company_addresses'
require 'sellsy/document_model'
require 'sellsy/document_models'
require 'sellsy/individual'
require 'sellsy/individuals'
require 'sellsy/individual_address'
require 'sellsy/individual_addresses'
require 'sellsy/invoice'
require 'sellsy/invoices'
require 'sellsy/tax'
require 'sellsy/taxes'

# v1
require 'sellsy/v1/get_infos'
require 'sellsy/v1/document_create'
require 'sellsy/v1/get_currencies'
require 'sellsy/v1/get_doc_layouts'
require 'sellsy/v1/get_pay_mediums'
require 'sellsy/v1/get_translation_languages'
require 'sellsy/v1/get_units'
require 'sellsy/v1/create_payment'
