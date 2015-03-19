require 'bundler/setup'
Bundler.setup

require 'rackconnect'
require 'yaml'

RSpec.configure do |c|
  c.before(:suite) do
    creds = YAML.load_file("/Users/mdarby/.fog")

    Rackconnect::Auth.new(
      {
        api_key: creds[:rackconnect][:rackspace_api_key],
        username: creds[:rackconnect][:rackspace_username],
        region: creds[:rackconnect][:rackspace_region]
      }
    )
  end
end
