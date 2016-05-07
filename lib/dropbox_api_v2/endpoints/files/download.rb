module DropboxApiV2::Endpoints::Files
  class Download < DropboxApiV2::Endpoints::Base
    Method      = :post
    Path        = "https://content.dropboxapi.com/2/files/download".freeze
    ResultType  = :file
    ErrorType   = DropboxApiV2::Errors::DownloadError

    # @method download(path)
    # Download a file from a user's Dropbox.
    #
    # @param path [String] The path of the file to download.
    add_endpoint :download do |path|
      perform_request(nil, {
        "Dropbox-API-Arg" => JSON.dump({:path => path}),
        "Content-Type" => ""
      })
    end
  end
end


# 2.
# add content-download endpoint-types
