class Rackconnect::LoadBalancerPoolNodeDetails < Rackconnect::Model

  endpoint_vars :pool_id, :node_id
  restful_endpoint { "/load_balancer_pools/#{pool_id}/nodes/#{node_id}/details" }
  attributes :created, :cloud_server, :id, :load_balancer_pool, :status, :status_detail, :updated

end
