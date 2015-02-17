require 'spec_helper'

describe Rackconnect::User do

  describe "#auth" do

    it "sets a token" do
      Rackconnect::User.auth()
    end

  end

end
