require 'bundler/setup'
Bundler.setup

require 'rackconnect'
require 'vcr'
require 'yaml'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = "spec/vcr/apiary"
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |c|
  c.before(:suite) do
    VCR.use_cassette(:auth) do
      creds = YAML.load_file("/Users/mdarby/.fog")

      Rackconnect::Auth.new({
        api_key: creds[:default][:rackspace_api_key],
        username: creds[:default][:rackspace_username]
      })
    end
  end
end
