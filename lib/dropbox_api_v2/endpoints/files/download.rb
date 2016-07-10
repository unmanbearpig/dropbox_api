module DropboxApiV2::Endpoints::Files
  class Download < DropboxApiV2::Endpoints::ContentDownload
    Method      = :post
    Path        = "/2/files/download".freeze
    ResultType  = DropboxApiV2::Metadata::File
    ErrorType   = DropboxApiV2::Errors::DownloadError

    # @method download(path)
    # Download a file from a user's Dropbox.
    #
    # @param path [String] The path of the file to download.
    add_endpoint :download do |path, &block|
      perform_request({:path => path}, &block)
    end
  end
end
