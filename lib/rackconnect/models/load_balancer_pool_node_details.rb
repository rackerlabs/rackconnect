class Rackconnect::LoadBalancerPoolNodeDetails
  include Rackconnect::SingletonModel
  include Rackconnect::BulkableModel

  endpoint_vars :pool_id, :node_id
  endpoint { "/load_balancer_pools/#{self.pool_id}/nodes/#{self.node_id}/details" }
  attributes :created, :cloud_server, :id, :load_balancer_pool, :status, :status_detail, :updated
  bulk_path "/load_balancer_pools/nodes/details"

end
