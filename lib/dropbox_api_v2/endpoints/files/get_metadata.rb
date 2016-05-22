module DropboxApiV2::Endpoints::Files
  class GetMetadata < DropboxApiV2::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/get_metadata".freeze
    ResultType  = :file_or_folder
    ErrorType   = DropboxApiV2::Errors::GetMetadataError

    # @method get_metadata(path, options = {})
    # Returns the metadata for a file or folder.
    #
    # Note: Metadata for the root folder is unsupported.
    #
    # @param path [String] The path of a file or folder on Dropbox.
    # @option include_media_info [Boolean] If `true`, FileMetadata.media_info
    #   is set for photo and video. The default for this field is `false`.
    # @option include_deleted [Boolean] If `true`, DeletedMetadata will be
    #   returned for deleted file or folder, otherwise LookupError.not_found
    #   will be returned. The default for this field is False.
    add_endpoint :get_metadata do |path, options = {}|
      params = options.merge({
        :path => path
      })

      perform_request params
    end
  end
end
