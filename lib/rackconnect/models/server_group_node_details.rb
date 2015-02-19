class Rackconnect::ServerGroupNodeDetails
  include Rackconnect::SingletonModel
  include Rackconnect::BulkableModel

  attributes :created, :cloud_server, :id, :server_group, :status, :status_detail, :updated
  endpoint_vars :group_id, :node_id
  endpoint { "/server_groups/#{group_id}/nodes/#{node_id}/details" }
  bulk_path "/server_groups/nodes/details"

end
