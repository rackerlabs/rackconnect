class Rackconnect::LoadBalancerPoolDetails < Rackconnect::Model

  endpoint_vars :pool_id
  restful_endpoint { "/load_balancer_pools/#{pool_id}/nodes/details" }
  attributes :created, :cloud_server, :id, :load_balancer_pool, :status, :status_detail, :updated

end
