class Rackconnect::ServerGroupNode < Rackconnect::Model

  class << self
    attr_accessor :group_id
  end

  restful_endpoint { "/server_groups/#{self.group_id}/nodes" }

  attr_accessor :created, :cloud_server, :id, :server_group, :status, :status_detail, :updated

end
