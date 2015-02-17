require 'pry'

class Rackconnect::Request

  ROOT = "http://private-12275-rcv3.apiary-mock.com"

  attr_accessor :body

  def initialize(options={})
    verb    = options[:verb]
    path    = options[:path]
    params  = options[:params].to_json
    headers = options[:headers] || {}
    headers.merge({"X-Auth-Token" => Rackconnect.token})

    if Rackconnect.token == nil
      raise "Please authenticate first. (Rackconnect::User.auth)"
    elsif verb == nil || path == nil
      raise "Need verb and path (Rackconnect::Request.new({verb: :get, path: \"google.com\"}))"
    else
      if verb == :get
        resp = RestClient.get(ROOT + path)
      else
        resp = RestClient.send(verb, ROOT + path, params, content_type: :json, accept: :json)
      end

      # TODO: Total hack. Bad API ATM.
      self.body = JSON.parse(resp.gsub(/\"ACTIVE,/, '"ACTIVE",').gsub(/null"/, "null"))
    end
  end

end
