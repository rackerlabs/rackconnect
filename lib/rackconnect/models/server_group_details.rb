class Rackconnect::ServerGroupDetails
  include Rackconnect::Model # Curiously; *not Singleton*

  endpoint_vars :group_id
  endpoint { "/server_groups/#{group_id}/nodes/details" }
  attributes :created, :cloud_server, :id, :server_group, :status, :status_detail, :updated

end
