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
    expect(public_ips.count).to eq(1)
  end

  it "is findable" do
    expect(public_ip.nil?).to eq(false)
  end

  it "can get details for a server" do
    VCR.use_cassette('public_ips_for_server') do
      id = "07426958-1ebf-4c38-b032-d456820ca21a"
      expect(Rackconnect::PublicIP.for_server(id).created.nil?).to eq(false)
    end
  end

  it "is creatable" do
    VCR.use_cassette('public_ip_create') do
      # TODO: This is a bit bothersome?
      obj = Rackconnect::PublicIP.create({})
      expect(obj.id.nil?).to be(false)
    end
  end

end
