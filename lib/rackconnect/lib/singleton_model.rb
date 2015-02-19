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
      resp = Rackconnect::Request.get(@_endpoint)
      self.new(json: resp.body)
    end
  end
end
