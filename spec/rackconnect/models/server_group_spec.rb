require 'spec_helper'

describe Rackconnect::ServerGroup do
  let(:server_groups) do
    Rackconnect::ServerGroup.all
  end

  let(:server_group) do
    Rackconnect::ServerGroup.find(server_groups.first.id)
  end

  it "is indexable" do
    expect(server_groups.count).to eq(3)
  end

  it "is findable" do
    expect(server_group.nil?).to eq(false)
  end

  it "is creatable" do
    # TODO: This is a bit bothersome?
    obj = Rackconnect::ServerGroup.create({})
    expect(obj.id.nil?).to be(false)
  end

  it "is destroyable" do
    expect(server_group.destroy).to be(true)
  end

  it "can bulk add nodes" do
    nodes = server_group.add_nodes(["d95ae0c4-6ab8-4873-b82f-f8433840cff2"])
    expect(nodes.count).to eq(2)
  end

  it "can bulk remove nodes" do
    nodes = server_group.add_nodes(["d95ae0c4-6ab8-4873-b82f-f8433840cff2"])
    resp = server_group.remove_nodes(["d95ae0c4-6ab8-4873-b82f-f8433840cff2"])
    expect(resp).to eq(true)
  end

end
