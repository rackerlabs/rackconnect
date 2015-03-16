module Rackconnect::Model

  def self.included(base)
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
    def initialize(options={})
      if options[:json] != nil
        options[:json].each do |(k,v)|
          self.send("#{k}=", v)
        end
      end
    end

    def save
      path = self.class.instance_variable_get("@_endpoint")

      if self.id.nil?
        resp = Rackconnect::Request.post(path, body: self.to_json)
      else
        path += "/#{self.id}"
        resp = Rackconnect::Request.put(path, body: self.to_json)
      end

      self.new(json: resp.body)
    end

    def destroy
      path = self.class.instance_variable_get("@_endpoint") + "/#{self.id}" # sorry
      resp = Rackconnect::Request.delete(path)
    end
  end

  module ClassMethods
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

    def create(options={})
      resp = Rackconnect::Request.post(@_endpoint, body: options.to_json)
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
end
