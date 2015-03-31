require 'spec_helper'

describe Rackconnect::ServerGroupNodeDetails do
  let(:server_groups) do
    Rackconnect::ServerGroup.all
  end

  let(:server_group) do
    Rackconnect::ServerGroup.find(server_groups.first.id)
  end

  let(:server_group_nodes) do
    Rackconnect::ServerGroupNode.all(group_id: server_groups.first.id)
  end

  let(:server_group_node) do
    Rackconnect::ServerGroupNode.find(server_group_nodes.first.id)
  end

  let(:server_group_node_details) do
    Rackconnect::ServerGroupNodeDetails.all(group_id: server_group.id, node_id: server_group_node.id)
  end

  it "is gettable" do
    expect(server_group_node_details.nil?).to eq(false)
  end

  it "can get details for a server" do
    id = "07426958-1ebf-4c38-b032-d456820ca21a"
    expect(Rackconnect::ServerGroupNodeDetails.for_server(id).first["created"].nil?).to eq(false)
  end

end
