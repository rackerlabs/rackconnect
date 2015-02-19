class Rackconnect::Request

  class << self

    def get(path, options={})
      self.new(options.merge({verb: :get, path: path}))
    end

    def post(path, options={})
      self.new(options.merge({verb: :post, path: path}))
    end

    def delete(path)
      self.new({verb: :delete, path: path})
      true
    end

  end

  attr_accessor :body

  def initialize(options={})
    verb    = options[:verb]
    path    = options[:path]
    body    = options[:body]
    headers = options[:headers] || {}
    headers.merge({"X-Auth-Token" => Rackconnect.token})

    if Rackconnect.token == nil
      raise "Please authenticate first. (Rackconnect::Auth)"
    elsif verb == nil || path == nil
      raise "Need verb and path (Rackconnect::Request.new({verb: :get, path: \"google.com\"}))"
    else
      url = Rackconnect::RACKCONNECT_URL + "/v3/#{Rackconnect.tenant_id}" + path

      if verb == :get
        resp = RestClient.get(url)
      elsif verb == :post
        resp = RestClient.post(url, body, content_type: :json, accept: :json)
      elsif verb == :delete
        resp = RestClient.delete(url)
      end

      # TODO: Total hack. Bad API ATM.

      unless resp.code == 204
        self.body = JSON.parse(resp.gsub(/\"ACTIVE,/, '"ACTIVE",').gsub(/null"/, "null"))
      end
    end
  end

end
