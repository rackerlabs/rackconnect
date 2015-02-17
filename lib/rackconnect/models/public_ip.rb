class Rackconnect::PublicIP < Rackconnect::Model

  attr_accessor :created, :cloud_server, :id, :public_ip_v4, :status, :status_detail, :updated

  restful_endpoint "/v3/#{Rackconnect.tenant_id}/public_ips"

end
