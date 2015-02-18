class Rackconnect::CloudNetwork < Rackconnect::Model

  attr_accessor :cidr, :created, :id, :name, :updated

  restful_endpoint { "/cloud_networks" }

end
