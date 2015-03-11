require 'bundler/setup'
Bundler.setup

require 'rackconnect'
require 'vcr'
require 'yaml'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = "spec/vcr/rackspace"
  c.allow_http_connections_when_no_cassette = true
end

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
