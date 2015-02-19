class Rackconnect::ServerGroupNodeDetails
  include Rackconnect::SingletonModel

  attributes :created, :cloud_server, :id, :server_group, :status, :status_detail, :updated
  endpoint_vars :group_id, :node_id
  endpoint { "/server_groups/#{group_id}/nodes/#{node_id}/details" }

end
