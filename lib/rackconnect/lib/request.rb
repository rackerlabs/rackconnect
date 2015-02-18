class Rackconnect::Request

  class << self

    def get(path, options={})
      self.new(options.merge({verb: :get, path: path}))
    end

  end

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
      url = Rackconnect::RACKCONNECT_URL + "/v3/#{Rackconnect.tenant_id}" + path

      if verb == :get
        resp = RestClient.get(url)
      else
        resp = RestClient.send(verb, url, params, content_type: :json, accept: :json)
      end

      # TODO: Total hack. Bad API ATM.
      self.body = JSON.parse(resp.gsub(/\"ACTIVE,/, '"ACTIVE",').gsub(/null"/, "null"))
    end
  end

end
