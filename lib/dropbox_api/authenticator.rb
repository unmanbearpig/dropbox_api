require 'oauth2'

module DropboxApi
  class Authenticator < OAuth2::Client
    def initialize(client_id, client_secret)
      @oauth_client = OAuth2::Client.new(client_id, client_secret, {
        :authorize_url => 'https://www.dropbox.com/1/oauth2/authorize',
        :token_url => 'https://api.dropboxapi.com/1/oauth2/token'
      })
    end

    def authorize_url(*args)
      @oauth_client.auth_code.authorize_url(*args)
    end

    def get_token(oauth_code)
      @oauth_client.auth_code.get_token oauth_code
    end
  end
end
