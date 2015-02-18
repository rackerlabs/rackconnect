class Rackconnect::PublicIP < Rackconnect::Model

  attr_accessor :created, :cloud_server, :id, :public_ip_v4, :status, :status_detail, :updated

  restful_endpoint { "/public_ips" }

end
