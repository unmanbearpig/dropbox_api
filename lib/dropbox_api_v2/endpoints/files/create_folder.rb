module DropboxApiV2::Endpoints::Files
  class CreateFolder < DropboxApiV2::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/create_folder".freeze
    ResultType  = DropboxApiV2::Metadata::Folder
    ErrorType   = DropboxApiV2::Errors::CreateFolderError

    # @method create_folder(path)
    # Create a folder at a given path.
    #
    # @param path [String] Path in the user's Dropbox to create.
    # @return [DropboxApiV2::Metadata::Folder] The new folder.
    add_endpoint :create_folder do |path|
      perform_request({
        :path => path
      })
    end
  end
end
