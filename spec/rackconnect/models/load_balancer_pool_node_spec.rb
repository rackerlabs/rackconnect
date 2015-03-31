require 'spec_helper'

describe Rackconnect::LoadBalancerPoolNode do
  let(:load_balancer_pool_nodes) do
    pool = Rackconnect::LoadBalancerPool.all.first
    Rackconnect::LoadBalancerPoolNode.all(pool_id: pool.id)
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
    # TODO: This is a bit bothersome?
    obj = Rackconnect::LoadBalancerPoolNode.create({})
    expect(obj.id.nil?).to be(false)
  end

  it "is destroyable" do
    expect(load_balancer_pool_node.destroy).to be(true)
  end
end
