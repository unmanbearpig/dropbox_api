module DropboxApiV2::Results
  class GetTemporaryLinkResult < DropboxApiV2::Results::Base
    def file
      @file ||= DropboxApiV2::Metadata::File.new(@data["metadata"])
    end

    def link
      @data["link"]
    end
  end
end
