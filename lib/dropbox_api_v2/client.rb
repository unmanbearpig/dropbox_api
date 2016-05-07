module DropboxApiV2
  class Client
    def initialize(oauth_bearer = ENV["DROPBOX_OAUTH_BEARER"])
      @oauth_bearer = oauth_bearer
    end

    def self.add_endpoint(connection_type, name, endpoint)
      define_method(name) do |*args|
        connection = send("#{connection_type}_connection")
        endpoint.new(connection).send(name, *args)
      end
    end

    private

    def rpc_connection
      @rpc_connection ||= Faraday.new(:url => "https://api.dropboxapi.com") do |c|
        c.authorization :Bearer, @oauth_bearer
        c.request :encode_json
        c.response :decode_json
        c.adapter Faraday.default_adapter
      end
    end

    def content_download_connection
      @content_download_connection ||= Faraday.new(:url => "https://content.dropboxapi.com") do |c|
        c.authorization :Bearer, @oauth_bearer
        c.request :encode_json
        c.response :decode_json
        c.adapter Faraday.default_adapter
      end
    end
  end
end
