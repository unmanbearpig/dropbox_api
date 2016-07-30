module DropboxApiV2::Results
  class ListRevisionsResult < DropboxApiV2::Results::Base
    # A collection of files and directories.
    def entries
      @entries ||= @data["entries"].map do |entry|
        DropboxApiV2::Metadata::File.new entry
      end
    end

    def is_deleted?
      @data["is_deleted"] == true
    end
  end
end
