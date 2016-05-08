module DropboxApiV2::Endpoints
  class Rpc < DropboxApiV2::Endpoints::Base
    def initialize(builder)
      @connection = builder.build("https://api.dropboxapi.com") do |c|
        c.request :encode_json
        c.response :decode_json
      end
    end
  end
end
