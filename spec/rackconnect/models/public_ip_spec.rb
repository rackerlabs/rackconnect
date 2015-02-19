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

end
