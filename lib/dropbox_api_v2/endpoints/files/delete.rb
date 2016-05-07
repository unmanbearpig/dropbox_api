module DropboxApiV2::Endpoints::Files
  class Delete < DropboxApiV2::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/delete".freeze
    ResultType  = :file_or_folder
    ErrorType   = DropboxApiV2::Errors::DeleteError

    # @method delete(path)
    # Delete the file or folder at a given path.
    #
    # If the path is a folder, all its contents will be deleted too.
    #
    # A successful response indicates that the file or folder was deleted.
    # The returned metadata will be the corresponding FileMetadata or
    # FolderMetadata for the item at time of deletion, and not a
    # DeletedMetadata object.
    #
    # @param path [String] Path in the user's Dropbox to delete.
    add_endpoint :delete do |path|
      perform_request({
        :path => path
      })
    end
  end
end
