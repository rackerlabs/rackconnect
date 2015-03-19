require 'spec_helper'

describe Rackconnect::LoadBalancerPoolDetails do
  let(:pools) do
    Rackconnect::LoadBalancerPool.all
  end

  let(:pool) do
    Rackconnect::LoadBalancerPool.find(pools.first.id)
  end

  let(:load_balancer_pool_details) do
    Rackconnect::LoadBalancerPoolDetails.all(pool_id: pool.id)
  end

  it "is reachable" do
    expect(load_balancer_pool_details.nil?).to eq(false)
  end
end
