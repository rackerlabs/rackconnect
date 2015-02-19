class Rackconnect::ServerGroup
  include Rackconnect::Model
  include Rackconnect::BulkNodes

  endpoint "/server_groups"
  attributes :created, :id, :name, :node_counts, :status, :status_detail, :updated

end
