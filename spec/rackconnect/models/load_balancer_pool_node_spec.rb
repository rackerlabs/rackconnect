require 'spec_helper'

describe Rackconnect::LoadBalancerPoolNode do
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

  it "is indexable" do
    expect(load_balancer_pool_nodes.count).to eq(3)
  end

  it "is findable" do
    expect(load_balancer_pool_node.nil?).to eq(false)
  end

  it "is creatable" do
    VCR.use_cassette('lbpn_create') do
      # TODO: This is a bit bothersome?
      obj = Rackconnect::LoadBalancerPoolNode.create({})
      expect(obj.id.nil?).to be(false)
    end
  end

  it "is destroyable" do
    VCR.use_cassette('load_balancer_pool_node_destroy') do
      expect(load_balancer_pool_node.destroy).to be(true)
    end
  end
end
