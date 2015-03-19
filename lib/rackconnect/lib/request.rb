class Rackconnect::Request

  class << self

    def get(path, options={})
      self.new(options.merge({verb: :get, path: path}))
    end

    def post(path, options={})
      self.new(options.merge({verb: :post, path: path}))
    end

    def put(path, options={})
      self.new(options.merge({verb: :put, path: path}))
    end

    def delete(path)
      self.new({verb: :delete, path: path})
      true
    end

  end

  attr_accessor :body

  def initialize(options={})
    @verb    = options[:verb]
    @path    = options[:path]
    @body    = options[:body]
    @headers = options[:headers] || {}

    @headers.merge!(
      {
        "X-Auth-Token" => Rackconnect.token,
        content_type: :json,
        accept: :json
      }
    )

    if Rackconnect.token.nil?
      raise "Please authenticate first. (Rackconnect::Auth)"
    elsif @verb.nil? || @path.nil?
      raise "Need verb and path (Rackconnect::Request.new({verb: :get, path: \"google.com\"}))"
    else
      @url = Rackconnect.url + @path

      if @verb == :get || @verb == :delete
        resp = RestClient.send(@verb, @url, @headers)
      elsif @verb == :post || @verb == :put
        resp = RestClient.send(@verb, @url, @body, @headers)
      else
        raise "The verb '#{@verb}' is not recognized."
      end

      self.body = JSON.parse(resp) if resp.length >= 2
    end
  rescue RestClient::Exception => e
    raise self.show_error(e)
  end

  def show_error(error)
    cyan  = "\033[0;31m"
    white = "\033[0m"
    e     = error.response
    s     = ["\n"]
    lines = "=" * 100

    s << "#{cyan}Sorry, you're not authorized to make this request:#{white}"
    s << lines
    s << ["Time", DateTime.now.utc]
    s << ["Verb", @verb]
    s << ["URL", @url]
    s << ["Headers", @headers]
    s << ["Body", @body]
    s << ["Error", e]
    s << lines
    s << ["Need Help?", "https://developer.rackspace.com/support"]
    s << lines
    s << "\n"

    s = s.inject([]) do |st, obj|
      if obj.is_a?(Array) && obj[1].present?
        st << "  #{cyan}#{obj[0]}:#{white} #{obj[1]}"
      elsif obj.is_a?(String)
        st << obj
      end

      st
    end

    s.join("\n")
  end

end
