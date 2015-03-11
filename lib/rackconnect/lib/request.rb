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

    headers.merge!(
      {
        "X-Auth-Token" => Rackconnect.token,
        content_type: :json,
        accept: :json
      }
    )

    if Rackconnect.token == nil
      raise "Please authenticate first. (Rackconnect::Auth)"
    elsif verb == nil || path == nil
      raise "Need verb and path (Rackconnect::Request.new({verb: :get, path: \"google.com\"}))"
    else
      url = Rackconnect.url + path

      if verb == :get || verb == :delete
        resp = RestClient.send(verb, url, headers)
      elsif verb == :post || verb == :put
        resp = RestClient.send(verb, url, body, headers)
      else
        raise "The verb '#{verb}' is not recognized."
      end

      unless resp.code == 204
        self.body = JSON.parse(resp)
      end
    end
  end

end
