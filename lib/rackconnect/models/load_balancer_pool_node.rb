class Rackconnect::LoadBalancerPoolNode < Rackconnect::Model

  endpoint_vars :pool_id
  restful_endpoint { "/load_balancer_pools/#{self.pool_id}/nodes" }
  attributes :created, :cloud_server, :id, :load_balancer_pool, :status, :status_detail, :updated

end
