module Rackconnect::BulkNodes

  def self.included(base)
    base.send :include, Rackconnect::Model
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def add_nodes(ids)
      body = ids.inject({}) do |hash, id|
        h = {}
        h[key] = {id: id}
        h["server_group"] = {id: self.id}
        hash.merge(h)
      end.to_json

      path = self.class.instance_variable_get("@_endpoint") + "/nodes" # sorry
      resp = Rackconnect::Request.post(path, body: body)
      resp.body.map{ |obj| node_class.new(json: obj) }
    end

    def remove_nodes(ids)
      body = ids.inject({}) do |hash, id|
        hash.merge({
          cloud_server: {id: id},
          server_group: {id: self.id}
        }).to_json
      end

      path = self.class.instance_variable_get("@_endpoint") + "/nodes" # sorry
      Rackconnect::Request.delete(path)
    end
  end

  def node_class
    str = server_based? ? "ServerGroup" : "LoadBalancerPool"
    Kernel.const_get "Rackconnect::#{str}Node"
  end

  def key
    server_based? ? "cloud_server" : "load_balancer_pool"
  end

  def server_based?
    self.class.to_s == "Rackconnect::ServerGroup"
  end

end
