require 'spec_helper'

describe Rackconnect::ServerGroup do
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

  it "is indexable" do
    expect(server_groups.count).to eq(3)
  end

  it "is findable" do
    expect(server_group.nil?).to eq(false)
  end

  it "is creatable" do
    VCR.use_cassette('server_group_create') do
      # TODO: This is a bit bothersome?
      obj = Rackconnect::ServerGroup.create({})
      expect(obj.id.nil?).to be(false)
    end
  end

end
