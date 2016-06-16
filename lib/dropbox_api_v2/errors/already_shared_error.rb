module DropboxApiV2::Errors
  class AlreadySharedError < BasicError
    def shared_folder
      DropboxApiV2::Metadata::SharedFolder.new @metadata
    end
  end
end
