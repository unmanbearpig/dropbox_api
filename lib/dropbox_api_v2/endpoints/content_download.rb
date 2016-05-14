module DropboxApiV2::Endpoints
  class ContentDownload < DropboxApiV2::Endpoints::Base
    def initialize(builder)
      @connection = builder.build("https://content.dropboxapi.com") do |c|
        c.request :encode_args_in_headers
        c.response :decode_result
      end
    end
  end
end
