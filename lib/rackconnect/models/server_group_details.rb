class Rackconnect::ServerGroupDetails < Rackconnect::Model

  class << self
    attr_accessor :group_id
  end

  restful_endpoint { "/server_groups/#{group_id}/nodes/details" }

  attr_accessor :created, :cloud_server, :id, :server_group, :status, :status_detail, :updated

end
