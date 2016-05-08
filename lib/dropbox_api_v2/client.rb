module DropboxApiV2
  class Client
    def initialize(oauth_bearer = ENV["DROPBOX_OAUTH_BEARER"])
      @connection_builder = ConnectionBuilder.new(oauth_bearer)
    end

    def self.add_endpoint(name, endpoint)
      define_method(name) do |*args|
        endpoint.new(@connection_builder).send(name, *args)
      end
    end
  end
end
