module Rackconnect

  class << self
    attr_accessor :token, :tenant_id, :url
  end

end

# Load after token/tenant_id setup
require "rackconnect/version"
require "rest-client"

Dir['./lib/rackconnect/lib/*.rb'].each{ |f| require f }
Dir['./lib/rackconnect/models/*.rb'].each{ |f| require f }
