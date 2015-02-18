class Rackconnect::PublicIP < Rackconnect::Model

  restful_endpoint "/public_ips"
  attributes :created, :cloud_server, :id, :public_ip_v4, :status, :status_detail, :updated

end
