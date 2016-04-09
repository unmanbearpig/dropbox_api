require 'dropbox_api_v2/endpoints/files'
# require 'dropbox_api_v2/endpoints/sharing'
# require 'dropbox_api_v2/endpoints/users'

module DropboxApiV2
  class Client
    include DropboxApiV2::Endpoints::Files
    # include DropboxApiV2::Endpoints::Sharing
    # include DropboxApiV2::Endpoints::Users

    def initialize(oauth_bearer = ENV["DROPBOX_OAUTH_BEARER"])
      @connection = Faraday.new(:url => "https://api.dropboxapi.com") do |c|
        c.authorization :Bearer, oauth_bearer
        c.request :encode_json
        c.response :decode_json
        c.adapter Faraday.default_adapter
      end
    end

    private

    def request(method, path, params, headers = nil)
      @connection.run_request(method, path, params, headers).body
    end
  end
end
