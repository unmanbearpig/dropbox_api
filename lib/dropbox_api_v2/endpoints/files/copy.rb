module DropboxApiV2::Endpoints::Files
  class Copy < DropboxApiV2::Endpoints::Base
    ErrorType   = DropboxApiV2::Errors::RelocationError
    ResultType  = :file_or_folder
    Path        = "/2/files/copy".freeze

    # Copy a file or folder to a different location in the user's Dropbox.
    # If the source path is a folder all its contents will be copied.
    #
    # @param from [String] Path in the user's Dropbox to be copied or moved.
    # @param to [String] Path in the user's Dropbox that is the destination.
    # @return The moved file.
    def copy(from, to)
      perform_request :post, {
        :from_path => from,
        :to_path => to
      }
    end

    add_endpoint :copy
  end
end
