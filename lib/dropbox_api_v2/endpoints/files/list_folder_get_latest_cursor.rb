module DropboxApiV2::Endpoints::Files
  class ListFolderGetLatestCursor < DropboxApiV2::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/list_folder/get_latest_cursor".freeze
    ResultType  = DropboxApiV2::Results::ListFolderGetLatestCursorResult
    ErrorType   = DropboxApiV2::Errors::ListFolderError

    include DropboxApiV2::Endpoints::OptionsValidator

    # A way to quickly get a cursor for the folder's state. Unlike list_folder,
    # list_folder_get_latest_cursor doesn't return any entries. This endpoint
    # is for app which only needs to know about new files and modifications and
    # doesn't need to know about files that already exist in Dropbox.
    #
    # @param path [String] The path to the folder you want to read.
    # @option recursive [Boolean] If `true`, the list folder operation will be
    #   applied recursively to all subfolders and the response will contain
    #   contents of all subfolders. The default for this field is `false`.
    # @option include_media_info [Boolean] If `true`, FileMetadata.media_info
    #   is set for photo and video. The default for this field is `false`.
    # @option include_deleted [Boolean] If `true`, DeletedMetadata will be
    #   returned for deleted file or folder, otherwise LookupError.not_found
    #   will be returned. The default for this field is False.
    add_endpoint :list_folder_get_latest_cursor do |options = {}|
      validate_options([
        :path,
        :recursive,
        :include_media_info,
        :include_deleted,
        :include_has_explicit_shared_members
      ], options)
      options[:recursive] ||= false
      options[:include_media_info] ||= false
      options[:include_deleted] ||= false

      perform_request options
    end
  end
end
