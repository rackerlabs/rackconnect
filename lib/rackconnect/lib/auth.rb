class Rackconnect::Auth

  def initialize(options={})
    api_key  = options[:api_key]
    username = options[:username]
    region   = options[:region]

    params = {
      :auth => {
        "RAX-KSKEY:apiKeyCredentials" => {
          "apiKey" => api_key,
          "username" => username
        }
      }
    }.to_json

    resp = RestClient.post Rackconnect::IDENTITY_URL, params, content_type: :json, accept: :json
    body = JSON.parse(resp)

    Rackconnect.token     = body["access"]["token"]["id"]
    Rackconnect.tenant_id = body["access"]["token"]["tenant"]["id"]
    Rackconnect.url       = set_url(body, region)
  end

  def to_s
    {auth_token: Rackconnect.token, tenant_id: Rackconnect.tenant_id, url: Rackconnect.url}
  end

  private

  def set_url(body, region=nil)
    eps = body["access"]["serviceCatalog"].find{ |eps| eps["name"] == "rackconnect" }["endpoints"]

    if region.nil?
      eps.first["publicURL"]
    else
      eps.find{ |ep| ep["region"] == region}["publicURL"]
    end
  end
end
