module Rackconnect::SingletonModel

  def self.included(base)
    base.send :include, Rackconnect::Model
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
  end

  module ClassMethods
    def all(*args)
      apply(args)
      resp = Rackconnect::Request.get(callable_endpoint)

      if resp.body.is_a?(Array)
        resp.body.map{ |b| self.new(json: b) }
      else
        self.new(json: resp.body)
      end
    end
  end
end
