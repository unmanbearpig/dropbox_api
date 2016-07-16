module DropboxApiV2::Endpoints::Files
  class Upload < DropboxApiV2::Endpoints::ContentUpload
    Method      = :post
    Path        = "/2/files/upload".freeze
    ResultType  = DropboxApiV2::Metadata::File
    ErrorType   = DropboxApiV2::Errors::UploadError

    # @method upload(path)
    # Create a new file with the contents provided in the request.
    # Do not use this to upload a file larger than 150 MB. Instead, create an
    # upload session with #upload_session_start().
    #
    # @param path [String] Path in the user's Dropbox to save the file.
    # @option autorename [Boolean] If there's a conflict, as determined by
    #   mode, have the Dropbox server try to autorename the file to avoid
    #   conflict. The default for this field is False.
    # @option mute [Boolean] Normally, users are made aware of any file
    #   modifications in their Dropbox account via notifications in the client
    #   software. If true, this tells the clients that this modification
    #   shouldn't result in a user notification. The default for this field is
    #   `false`.
    add_endpoint :upload do |path, content, options = {}|
      perform_request({:path => path}, content)
    end
  end
end
