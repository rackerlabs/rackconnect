class Rackconnect::ServerGroup < Rackconnect::Model

  attr_accessor :created, :id, :name, :node_counts, :status, :status_detail, :updated

  restful_endpoint "/v3/#{Rackconnect.tenant_id}/server_groups"

end