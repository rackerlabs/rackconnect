require 'spec_helper'

describe Rackconnect::LoadBalancerPool do
  let(:load_balancer_pools) do
    VCR.use_cassette('load_balancer_pools') do
      Rackconnect::LoadBalancerPool.all
    end
  end

  let(:load_balancer_pool) do
    VCR.use_cassette('load_balancer_pool') do
      Rackconnect::LoadBalancerPool.find(load_balancer_pools.first.id)
    end
  end

  it "is indexable" do
    expect(load_balancer_pools.count).to eq(3)
  end

  it "is findable" do
    expect(load_balancer_pool.nil?).to eq(false)
  end

end
