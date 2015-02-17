class Rackconnect::CloudNetwork < Rackconnect::Model

  attr_accessor :cidr, :created, :id, :name, :updated

  restful_endpoint "/v3/#{Rackconnect.tenant_id}/cloud_networks"

end
