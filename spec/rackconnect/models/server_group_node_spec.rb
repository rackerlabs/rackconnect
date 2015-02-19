require 'spec_helper'

describe Rackconnect::ServerGroupNode do
  let(:server_group_nodes) do
    VCR.use_cassette('server_group_nodes') do
      Rackconnect::ServerGroupNode.all
    end
  end

  let(:server_group_node) do
    VCR.use_cassette('server_group_node') do
      Rackconnect::ServerGroupNode.find(server_group_nodes.first.id)
    end
  end

  it "is indexable" do
    expect(server_group_nodes.count).to eq(3)
  end

  it "is findable" do
    expect(server_group_node.nil?).to eq(false)
  end

end
