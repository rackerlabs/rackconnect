class Rackconnect::ServerGroupDetails
  include Rackconnect::Model

  endpoint_vars :group_id
  endpoint { "/server_groups/#{group_id}/nodes/details" }
  attributes :created, :cloud_server, :id, :server_group, :status, :status_detail, :updated

end
