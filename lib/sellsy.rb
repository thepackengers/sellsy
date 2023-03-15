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
    def_delegators :client, :invoices, :companies, :individuals,
                   :document_models, :taxes

    def_delegators :client, :get_infos

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
require 'sellsy/get_infos'
