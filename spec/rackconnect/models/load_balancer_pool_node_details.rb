require 'spec_helper'

describe Rackconnect::LoadBalancerPoolNodeDetails do
  let(:load_balancer_pool_node_details) do
    Rackconnect::Cloudload_balancer_pool_detail.all
  end

  let(:load_balancer_pool_detail) do
    Rackconnect::Cloudload_balancer_pool_detail.find(load_balancer_pool_node_details.first.id)
  end

  it "is indexable" do
    expect(load_balancer_pool_node_details.count).to eq(1)
  end

  it "is findable" do
    expect(load_balancer_pool_detail.nil?).to eq(false)
  end
end
