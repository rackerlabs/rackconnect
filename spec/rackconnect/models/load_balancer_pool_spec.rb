require 'spec_helper'

describe Rackconnect::LoadBalancerPool do
  let(:load_balancer_pools) do
    Rackconnect::LoadBalancerPool.all
  end

  let(:load_balancer_pool) do
    Rackconnect::LoadBalancerPool.find(load_balancer_pools.first.id)
  end

  it "is indexable" do
    expect(load_balancer_pools.count).to eq(12)
  end

  it "is findable" do
    expect(load_balancer_pool.nil?).to eq(false)
  end

  it "can bulk add nodes" do
    nodes = load_balancer_pool.add_nodes(["d95ae0c4-6ab8-4873-b82f-f8433840cff2"])
    expect(nodes.count).to eq(2)
  end

  it "can bulk remove nodes" do
    nodes = load_balancer_pool.add_nodes(["d95ae0c4-6ab8-4873-b82f-f8433840cff2"])
    resp = load_balancer_pool.remove_nodes(["d95ae0c4-6ab8-4873-b82f-f8433840cff2"])
    expect(resp).to eq(true)
  end

end
