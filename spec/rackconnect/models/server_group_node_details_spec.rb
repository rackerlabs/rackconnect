require 'spec_helper'

describe Rackconnect::ServerGroupNodeDetails do
  let(:server_groups) do
    VCR.use_cassette('server_groups') do
      Rackconnect::ServerGroup.all
    end
  end

  let(:server_group) do
    VCR.use_cassette('server_group') do
      Rackconnect::ServerGroup.find(server_groups.first.id)
    end
  end

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

  let(:server_group_node_details) do
    VCR.use_cassette('server_group_node_details') do
      Rackconnect::ServerGroupNodeDetails.all(group_id: server_group.id, node_id: server_group_node.id)
    end
  end

  it "is gettable" do
    expect(server_group_node_details.nil?).to eq(false)
  end

end
