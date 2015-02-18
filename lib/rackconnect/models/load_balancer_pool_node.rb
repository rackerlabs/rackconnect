class Rackconnect::LoadBalancerPoolNode < Rackconnect::Model

  class << self
    attr_accessor :parent_id
  end

  restful_endpoint "/v3/#{Rackconnect.tenant_id}/load_balancer_pools/#{parent_id}/nodes"

  attr_accessor :created, :cloud_server, :id, :load_balancer_pool, :status, :status_detail, :updated

end
