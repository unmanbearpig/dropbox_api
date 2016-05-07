module DropboxApiV2::Endpoints
  class ContentDownload < DropboxApiV2::Endpoints::Base
    def self.connection_type
      :content_download
    end
  end
end
