require 'spec_helper'

describe Rackconnect::PublicIP do
  let(:public_ips) do
    Rackconnect::PublicIP.all
  end

  let(:public_ip) do
    Rackconnect::PublicIP.find(public_ips.first.id)
  end

  it "is indexable" do
    expect(public_ips.count).to eq(1)
  end

  it "is findable" do
    expect(public_ip.nil?).to eq(false)
  end

  it "can get details for a server" do
    expect(Rackconnect::PublicIP.for_server(public_ip.id).class).to eq(Array)
  end

  it "is creatable" do
    net = Rackconnect::CloudNetwork.all.first
    obj = Rackconnect::PublicIP.new
    obj.cloud_server = {id: net.id}
    obj.save

    expect(obj.id.nil?).to be(false)
  end

  it "is destroyable" do
    expect(public_ip.destroy).to be(true)
  end

end
