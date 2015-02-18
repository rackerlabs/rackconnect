class Rackconnect::LoadBalancerPool < Rackconnect::Model

  attr_accessor :id, :name, :node_counts, :port, :status, :status_detail, :virtual_ip

  restful_endpoint { "/load_balancer_pools" }

end
