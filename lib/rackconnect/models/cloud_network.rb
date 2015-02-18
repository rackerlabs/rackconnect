class Rackconnect::CloudNetwork < Rackconnect::Model

  endpoint "/cloud_networks"
  attributes :cidr, :created, :id, :name, :updated

end
