class Rackconnect::Auth

  def initialize(options={})
    api_key  = options[:api_key]
    username = options[:username]

    params = {
      :auth => {
        "RAX-KSKEY:apiKeyCredentials" => {
          "apiKey" => api_key,
          "username" => username
        }
      }
    }.to_json

    resp = RestClient.post "https://identity.api.rackspacecloud.com/v2.0/tokens", params, content_type: :json, accept: :json
    body = JSON.parse(resp)

    Rackconnect.token     = body["access"]["token"]["id"]
    Rackconnect.tenant_id = body["access"]["token"]["tenant"]["id"]
  end

  def to_s
    {auth_token: Rackconnect.token, tenant_id: Rackconnect.tenant_id}
  end

end
