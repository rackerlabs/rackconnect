class Rackconnect::ServerGroup < Rackconnect::Model

  endpoint "/server_groups"
  attributes :created, :id, :name, :node_counts, :status, :status_detail, :updated

end
