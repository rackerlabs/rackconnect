require 'spec_helper'

describe Rackconnect::ServerGroupNode do
  let(:server_group_nodes) do
    Rackconnect::ServerGroupNode.all
  end

  let(:server_group_node) do
    Rackconnect::ServerGroupNode.find(server_group_nodes.first.id)
  end

  it "is indexable" do
    expect(server_group_nodes.count).to eq(2)
  end

  it "is findable" do
    expect(server_group_node.nil?).to eq(false)
  end

  it "is creatable" do
    # TODO: This is a bit bothersome?
    obj = Rackconnect::ServerGroupNode.create({})
    expect(obj.id.nil?).to be(false)
  end

  it "is destroyable" do
    expect(server_group_node.destroy).to be(true)
  end

end
