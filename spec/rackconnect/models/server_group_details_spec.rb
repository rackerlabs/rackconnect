require 'spec_helper'

describe Rackconnect::ServerGroupDetails do
  let(:server_group_details) do
    Rackconnect::ServerGroupDetails.all
  end

  it "is findable" do
    expect(server_group_details.count).to eq(1)
  end

end
