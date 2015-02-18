class Rackconnect::LoadBalancerPoolDetails < Rackconnect::Model

  class << self
    attr_accessor :pool_id
  end

  restful_endpoint { "/load_balancer_pools/#{pool_id}/nodes/details" }

  attr_accessor :created, :cloud_server, :id, :load_balancer_pool, :status, :status_detail, :updated

end
