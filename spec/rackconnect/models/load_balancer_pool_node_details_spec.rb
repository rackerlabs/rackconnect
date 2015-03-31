require 'spec_helper'

describe Rackconnect::LoadBalancerPoolNodeDetails do
  let(:pools) do
    Rackconnect::LoadBalancerPool.all
  end

  let(:pool) do
    Rackconnect::LoadBalancerPool.find(pools.first.id)
  end

  let(:load_balancer_pool_nodes) do
    Rackconnect::LoadBalancerPoolNode.all(pool_id: pool.id)
  end

  let(:load_balancer_pool_node) do
    Rackconnect::LoadBalancerPoolNode.find(load_balancer_pool_nodes.first.id)
  end

  let(:load_balancer_pool_node_details) do
    Rackconnect::LoadBalancerPoolNodeDetails.all(pool_id: pool.id, node_id: load_balancer_pool_node.id)
  end

  it "is gettable" do
    expect(load_balancer_pool_node_details.nil?).to eq(false)
  end

  it "can get details for a server" do
    id = "1860451d-fb89-45b8-b54e-151afceb50e5"
    expect(Rackconnect::LoadBalancerPoolNodeDetails.for_server(id).first["created"].nil?).to eq(false)
  end

end
