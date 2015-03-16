module Rackconnect

  class << self
    attr_accessor :token, :tenant_id, :url
  end

end

# Load after token/tenant_id setup
require "rackconnect/version"
require "active_support/inflector"
require "active_support/core_ext"
require "rest-client"
require "pry"

Dir['./lib/rackconnect/lib/*.rb'].each{ |f| require f }
Dir['./lib/rackconnect/models/*.rb'].each{ |f| require f }
