require 'spec_helper'

describe Rackconnect::LoadBalancerPoolNode do
  let(:load_balancer_pool) do
    Rackconnect::LoadBalancerPool.all.first
  end

  let(:load_balancer_pool_nodes) do
    Rackconnect::LoadBalancerPoolNode.all(pool_id: load_balancer_pool.id)
  end

  let(:load_balancer_pool_node) do
    Rackconnect::LoadBalancerPoolNode.find(load_balancer_pool_nodes.first.id)
  end

  it "is indexable" do
    expect(load_balancer_pool_nodes.count).to eq(3)
  end

  it "is findable" do
    expect(load_balancer_pool_node.nil?).to eq(false)
  end

  it "is creatable" do
    obj = Rackconnect::LoadBalancerPoolNode.create({pool_id: load_balancer_pool.id})
    expect(obj.id.nil?).to be(false)
  end

  it "is destroyable" do
    expect(load_balancer_pool_node.destroy).to be(true)
  end
end
