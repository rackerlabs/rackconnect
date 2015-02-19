require 'spec_helper'

describe Rackconnect::ServerGroupDetails do
  let(:server_group_details) do
    VCR.use_cassette('server_group_details') do
      Rackconnect::ServerGroupDetails.all
    end
  end

  it "is findable" do
    expect(server_group_details.count).to eq(3)
  end

end
