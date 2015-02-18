class Rackconnect::Model

  class << self
    def endpoint(str=nil, options={}, &block)
      @_endpoint = block_given? ? yield(block) : str
    end

    def endpoint_vars(*args)
      # Inject into class level of descendant class
      self.class.module_eval{ attr_accessor *args }
    end

    def attributes(*args)
      attr_accessor *args
    end

    def all(*args)
      apply(args)
      resp = Rackconnect::Request.get(@_endpoint)
      resp.body.map{ |obj| self.new(json: obj) }
    end

    def find(*args)
      id = apply(args)
      resp = Rackconnect::Request.get("#{@_endpoint}/#{id}")
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
