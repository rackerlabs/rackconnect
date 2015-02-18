class Rackconnect::ServerGroupNodeDetails < Rackconnect::Model

  class << self
    attr_accessor :group_id, :node_id
  end

  restful_endpoint { "/server_groups/#{group_id}/nodes/#{node_id}/details" }

  attr_accessor :created, :cloud_server, :id, :server_group, :status, :status_detail, :updated

end
