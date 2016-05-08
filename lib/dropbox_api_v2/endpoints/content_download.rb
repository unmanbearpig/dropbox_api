module DropboxApiV2::Endpoints
  class ContentDownload < DropboxApiV2::Endpoints::Base
    def initialize(builder)
      @connection = builder.build("https://content.dropboxapi.com") do |c|
        c.request :encode_json
        c.response :decode_json
      end
    end
  end
end
