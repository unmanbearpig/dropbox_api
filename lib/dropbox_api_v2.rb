require "dropbox_api_v2/version"

module DropboxApiV2
  def authenticate
    client_id = "CLIENT_ID"
    client_secret = "CLIENT_SECRET"

    client = OAuth2::Client.new(client_id, client_secret,
      :site => "https://www.dropbox.com",
      :authorize_url => '/1/oauth2/authorize',
      :token_url => 'https://api.dropboxapi.com/1/oauth2/token'
    )
    client.auth_code.authorize_url
    # => "https://www.dropbox.com/1/oauth2/authorize?client_id=dsbxuanemaudn1u&response_type=code"

    # Get the code from that web page and store it in `oauth_code`
    oauth_code = "OAUTH_CODE"

    bearer = client.auth_code.get_token oauth_code

    bearer.token
    # => "AUTH_BEARER"

    # You can now use that token for API calls, example:
    #
    # curl -X POST https://api.dropboxapi.com/2/files/search \
    #     --header "Authorization: Bearer AUTH_BEARER" \
    #     --header "Content-Type: application/json" \
    #     --data "{\"path\": \"\",\"query\": \"dev\",\"start\": 0,\"max_results\": 100,\"mode\": \"filename\"}"
  end
end
