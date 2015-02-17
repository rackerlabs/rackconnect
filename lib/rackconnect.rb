module Rackconnect

  class << self
    @@token     = nil
    @@tenant_id = nil

    def token=(token)
      @@token = token
    end

    def tenant_id=(tenant_id)
      @@tenant_id = tenant_id
    end

    def token
      @@token
    end

    def tenant_id
      @@tenant_id
    end
  end
end

# Load after token/tenant_id setup
require "rackconnect/version"
require "rest-client"

Dir['./lib/rackconnect/lib/*.rb'].each{ |f| require f }
Dir['./lib/rackconnect/models/*.rb'].each{ |f| require f }
