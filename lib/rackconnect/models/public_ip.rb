class Rackconnect::PublicIP
  include Rackconnect::BulkableModel

  endpoint "/public_ips"
  attributes :created, :cloud_server, :id, :public_ip_v4, :status, :status_detail, :updated
  bulk_path "/public_ips"

end
