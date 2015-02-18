require 'spec_helper'

describe Rackconnect::CloudNetwork do

  let(:networks) do
    VCR.use_cassette('networks') do
      Rackconnect::CloudNetwork.all
    end
  end

  let(:network) do
    VCR.use_cassette('network') do
      Rackconnect::CloudNetwork.find(networks.first.id)
    end
  end

  it "is indexable" do
    expect(networks.count).to eq(1)
  end

  it "is findable" do
    expect(network.nil?).to eq(false)
  end
end
