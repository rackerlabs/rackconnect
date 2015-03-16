require 'spec_helper'

describe Rackconnect::PublicIP do
  let(:public_ips) do
    VCR.use_cassette('public_ips') do
      Rackconnect::PublicIP.all
    end
  end

  let(:public_ip) do
    VCR.use_cassette('public_ip') do
      Rackconnect::PublicIP.find(public_ips.first.id)
    end
  end

  it "is indexable" do
    expect(public_ips.count).to eq(9)
  end

  it "is findable" do
    expect(public_ip.nil?).to eq(false)
  end

  it "can get details for a server" do
    VCR.use_cassette('public_ips_for_server') do
      expect(Rackconnect::PublicIP.for_server(public_ip.id)).to eq([])
    end
  end

  it "is creatable" do
    # VCR.use_cassette('public_ip_create') do
    net = Rackconnect::CloudNetwork.all.first
    obj = Rackconnect::PublicIP.new
    obj.cloud_server = {id: net.id}
    obj.save

    expect(obj.id.nil?).to be(false)
    # end
  end

  it "is destroyable" do
    VCR.use_cassette('public_ip_destroy') do
      expect(public_ip.destroy).to be(true)
    end
  end

end
