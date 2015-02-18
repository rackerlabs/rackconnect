class Rackconnect::LoadBalancerPool
  include Rackconnect::Model

  endpoint "/load_balancer_pools"
  attributes :id, :name, :node_counts, :port, :status, :status_detail, :virtual_ip

end
