module DropboxApiV2::Endpoints::Files
  class Copy < DropboxApiV2::Endpoints::Base
    Method      = :post
    Path        = "/2/files/copy".freeze
    ResultType  = :file_or_folder
    ErrorType   = DropboxApiV2::Errors::RelocationError

    # @method copy(from, to)
    # Copy a file or folder to a different location in the user's Dropbox.
    # If the source path is a folder all its contents will be copied.
    #
    # @param from [String] Path in the user's Dropbox to be copied or moved.
    # @param to [String] Path in the user's Dropbox that is the destination.
    # @return The moved file.
    add_endpoint :copy do |from, to|
      perform_request({
        :from_path => from,
        :to_path => to
      })
    end
  end
end
