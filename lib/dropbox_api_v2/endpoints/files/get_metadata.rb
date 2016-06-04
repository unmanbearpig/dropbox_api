module DropboxApiV2::Endpoints::Files
  class GetMetadata < DropboxApiV2::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/get_metadata".freeze
    ResultType  = DropboxApiV2::Metadata::Resource
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
      validate_options(options)

      perform_request(options.merge({
        :path => path
      }))
    end

    private

    def validate_options(options)
      valid_option_keys = %i(include_media_info include_deleted)

      options.keys.each do |key|
        unless valid_option_keys.include? key.to_sym
          raise ArgumentError, "Invalid option `#{key}`"
        end
      end
    end
  end
end
