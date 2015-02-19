require 'spec_helper'

describe Rackconnect::LoadBalancerPoolDetails do
  let(:pools) do
    VCR.use_cassette('pools') do
      Rackconnect::LoadBalancerPool.all
    end
  end

  let(:pool) do
    VCR.use_cassette('pool') do
      Rackconnect::LoadBalancerPool.find(pools.first.id)
    end
  end

  let(:load_balancer_pool_details) do
    VCR.use_cassette('load_balancer_pool_details') do
      Rackconnect::LoadBalancerPoolDetails.all(pool_id: pool.id)
    end
  end

  it "is reachable" do
    expect(load_balancer_pool_details.nil?).to eq(false)
  end
end
