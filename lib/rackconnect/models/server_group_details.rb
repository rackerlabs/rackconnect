class Rackconnect::ServerGroupDetails < Rackconnect::Model

  endpoint_vars :group_id
  restful_endpoint { "/server_groups/#{group_id}/nodes/details" }
  attributes :created, :cloud_server, :id, :server_group, :status, :status_detail, :updated

end
