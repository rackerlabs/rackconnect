module Rackconnect::BulkableModel

  def self.included(base)
    base.send :include, Rackconnect::Model
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
  end

  module ClassMethods
    def for_server(server_id)
      resp = Rackconnect::Request.get(@_bulk_endpoint + "?cloud_server_id=#{server_id}")
      self.new(json: resp.body.first)
    end
  end
end
