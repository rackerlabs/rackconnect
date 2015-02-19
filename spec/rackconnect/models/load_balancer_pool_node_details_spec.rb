require 'spec_helper'

describe Rackconnect::LoadBalancerPoolNodeDetails do
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

  let(:load_balancer_pool_nodes) do
    VCR.use_cassette('load_balancer_pool_nodes') do
      Rackconnect::LoadBalancerPoolNode.all
    end
  end

  let(:load_balancer_pool_node) do
    VCR.use_cassette('load_balancer_pool_node') do
      Rackconnect::LoadBalancerPoolNode.find(load_balancer_pool_nodes.first.id)
    end
  end

  let(:load_balancer_pool_node_details) do
    VCR.use_cassette('load_balancer_pool_node_details') do
      Rackconnect::LoadBalancerPoolNodeDetails.all(pool_id: pool.id, node_id: load_balancer_pool_node.id)
    end
  end

  it "is gettable" do
    expect(load_balancer_pool_node_details.nil?).to eq(false)
  end

end
