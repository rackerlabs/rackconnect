class Rackconnect::ServerGroupNodeDetails < Rackconnect::Model

  attributes :created, :cloud_server, :id, :server_group, :status, :status_detail, :updated
  endpoint_vars :group_id, :node_id
  restful_endpoint { "/server_groups/#{group_id}/nodes/#{node_id}/details" }

end
