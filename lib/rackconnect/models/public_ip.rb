class Rackconnect::PublicIP
  include Rackconnect::BulkableModel

  endpoint  "/public_ips"
  bulk_path "/public_ips"

  attributes :created, :cloud_server, :id, :public_ip_v4,
    :status, :status_detail, :updated, :configuration_to_cloud_account_uuid,
    :retain, :failure_core_ticket_uuid

end
