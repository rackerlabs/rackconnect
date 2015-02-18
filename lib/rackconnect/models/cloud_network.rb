class Rackconnect::CloudNetwork < Rackconnect::Model

  restful_endpoint "/cloud_networks"
  attributes :cidr, :created, :id, :name, :updated

end
