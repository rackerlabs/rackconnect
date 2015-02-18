class Rackconnect::Model

  class << self
    attr_accessor :endpoint

    def restful_endpoint(str=nil, &block)
      @endpoint = block_given? ? yield(block) : str
    end

    def all(*args)
      apply(args)
      resp = Rackconnect::Request.get(endpoint)
      resp.body.map{ |obj| self.new(json: obj) }
    end

    def find(*args)
      id = apply(args)
      resp = Rackconnect::Request.get("#{endpoint}/#{id}")
      self.new(json: resp.body)
    end

    private

    def apply(args)
      first = args.first

      # Plain resource ID string
      return first if first.is_a?(String)

      # Parent IDs, etc.
      if first.is_a?(Array)
        args.each do |(arg)|
          arg.each do |(k,v)|
            self.send("#{k}=", v)
          end
        end
      end
    end
  end

  def initialize(options={})
    if options[:json] != nil
      options[:json].each do |(k,v)|
        self.send("#{k}=", v)
      end
    end
  end

end
