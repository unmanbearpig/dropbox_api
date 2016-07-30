module DropboxApiV2::Results
  class ListFolderGetLatestCursorResult < DropboxApiV2::Results::Base
    def cursor
      @data["cursor"]
    end
  end
end
