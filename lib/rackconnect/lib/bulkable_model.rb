module Rackconnect::BulkableModel

  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
  end

  module ClassMethods
    def bulk_path(str)
      @_bulk_endpoint = str
    end

    def for_server(server_id)
      Rackconnect::Request.get(@_bulk_endpoint + "?cloud_server_id=#{server_id}").body
    end
  end
end
