require 'sinatra'

set :server, :thin
set :port, 7000

before do
  content_type 'application/json'
end

get '/v3/:tenant_id/cloud_networks' do
  respond_with :cloud_server, :index
end

get '/v3/:tenant_id/cloud_networks/:id' do
  respond_with :cloud_server, :show
end

get '/v3/:tenant_id/load_balancer_pools' do
  respond_with :load_balancer_pool, :index
end

get '/v3/:tenant_id/load_balancer_pools/:id' do
  respond_with :load_balancer_pool, :show
end

get '/v3/:tenant_id/load_balancer_pools/:id/nodes' do
  respond_with :node, :index
end

post '/v3/:tenant_id/load_balancer_pools/:id/nodes' do
  respond_with :node, :create
end

get '/v3/:tenant_id/load_balancer_pools/:id/nodes/details' do
  respond_with :node, :details
end

get '/v3/:tenant_id/load_balancer_pools/:load_balancer_pool_id/nodes/:id' do
  respond_with :node, :show
end

delete '/v3/:tenant_id/load_balancer_pools/:load_balancer_pool_id/nodes/:id' do
  ""
end

get '/v3/:tenant_id/load_balancer_pools/:load_balancer_pool_id/nodes/:id/details' do
  respond_with :node, :show_details
end

post '/v3/:tenant_id/load_balancer_pools/nodes' do
  respond_with :load_balancer_pool, :nodes
end

delete '/v3/:tenant_id/load_balancer_pools/nodes' do
  ""
end

get '/v3/:tenant_id/load_balancer_pools/nodes/details?cloud_server_id=:cloud_server_id' do
  respond_with :node, :buld_details
end

get '/v3/:tenant_id/public_ips' do
  respond_with :public_ip, :index
end

post '/v3/:tenant_id/public_ips' do
  respond_with :public_ip, :create
end

get '/v3/:tenant_id/public_ips?cloud_server_id=:cloud_server_id' do
  respond_with :public_ip, :bulk_index
end

post '/v3/:tenant_id/public_ips/:id' do
  respond_with :public_ip, :show
end

delete '/v3/:tenant_id/public_ips/:id' do
  ""
end

get '/v3/:tenant_id/server_groups' do
  respond_with :server_group, :index
end

post '/v3/:tenant_id/server_groups' do
  respond_with :server_group, :create
end

get '/v3/:tenant_id/server_groups/:id' do
  respond_with :server_group, :show
end

delete '/v3/:tenant_id/server_groups/:id' do
  ""
end

get '/v3/:tenant_id/server_groups/:server_group_id/nodes' do
  respond_with :server_group, :node_index
end

post '/v3/:tenant_id/server_groups/:server_group_id/nodes' do
  respond_with :server_group, :create_group_node
end

get '/v3/:tenant_id/server_groups/:server_group_id/nodes/details' do
  respond_with :server_group, :node_details
end

get '/v3/:tenant_id/server_groups/:server_group_id/nodes/:id' do
  respond_with :server_group, :show_node
end

delete '/v3/:tenant_id/server_groups/:server_group_id/nodes/:id' do
  ""
end

get '/v3/:tenant_id/server_groups/:server_group_id/nodes/:id/details' do
  respond_with :server_group, :show_node_details
end

post '/v3/:tenant_id/server_groups/nodes' do
  respond_with :server_group, :create_node
end

delete '/v3/:tenant_id/server_groups/nodes' do
  ""
end

get '/v3/:tenant_id/server_groups/nodes/details?cloud_server_id=:cloud_server_id' do
  respond_with :server_group, :bulk_details
end

private

def respond_with(obj, action)
  File.read("./spec/support/#{obj}/#{action}.json")
end
