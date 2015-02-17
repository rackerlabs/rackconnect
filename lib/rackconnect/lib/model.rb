class Rackconnect::Model

  class << self
    attr_accessor :endpoint

    def restful_endpoint(str)
      @endpoint = str
    end

    def all
      resp = Rackconnect::Request.new({verb: :get, path: @endpoint})
      resp.body.map{ |obj| self.new(json: obj) }
    end

    def find(id)
      resp = Rackconnect::Request.new({verb: :get, path: "#{@endpoint}/#{id}"})
      self.new(json: resp.body)
    end
  end

  def initialize(options={})
    if options[:json] != nil
      options[:json].each do |k,v|
        self.send("#{k}=", v)
      end
    end
  end

end
