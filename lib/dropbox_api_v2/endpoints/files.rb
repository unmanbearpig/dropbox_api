module DropboxApiV2::Endpoints
  module Files
    # Copy a file or folder to a different location in the user's Dropbox.
    # If the source path is a folder all its contents will be copied.
    #
    # @param from [String] Path in the user's Dropbox to be copied or moved.
    # @param to [String] Path in the user's Dropbox that is the destination.
    # @return The moved file.
    def copy(from, to)
      request :post, "/2/files/copy", {
        :from_path => from,
        :to_path => to
      }, :file_or_folder
    end

    # Create a folder at a given path.
    #
    # @param path [String] Path in the user's Dropbox to create.
    def create_folder(path)
      request :post, "/2/files/create_folder", {
        :path => path
      }
    end

    # Create a folder at a given path.
    #
    # @param path [String] Path in the user's Dropbox to create.
    def create_folder(path)
      request :post, "/2/files/create_folder", {
        :path => path
      }
    end

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
    def delete(path)
      request :post, "/2/files/delete", {
        :path => path
      }
    end

    # Download a file from a user's Dropbox.
    #
    # @param path [String] The path of the file to download.
    def download(path)
      request :post, "/2/files/download", {
        :path => path
      }
    end

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
    def get_metadata(path, options = {})
      options[:include_media_info] ||= false
      options[:include_deleted] ||= false

      request :post, "/2/files/get_metadata", {
        :path => path,
        :include_media_info => options[:include_media_info],
        :include_deleted => options[:include_deleted]
      }, :file_or_folder
    end

    # Get a preview for a file. Currently previews are only generated for the
    # files with the following extensions: .doc, .docx, .docm, .ppt, .pps,
    # .ppsx, .ppsm, .pptx, .pptm, .xls, .xlsx, .xlsm, .rtf
    #
    # @param path [String] The path of the file to preview.
    def get_preview(path)
      request :post, "/2/files/get_preview", {
        :path => path
      }
    end

    # Get a temporary link to stream content of a file. This link will expire
    # in four hours and afterwards you will get 410 Gone. Content-Type of the
    # link is determined automatically by the file's mime type.
    #
    # @param path [String] The path to the file you want a temporary link to.
    def get_temporary_link(path)
      request :post, "/2/files/get_temporary_link", {
        :path => path
      }
    end

    # Get a thumbnail for an image.
    #
    # This method currently supports files with the following file extensions:
    # jpg, jpeg, png, tiff, tif, gif and bmp. Photos that are larger than 20MB
    # in size won't be converted to a thumbnail.
    #
    # @param path [String] The path to the image file you want to thumbnail.
    # @option format [:jpg, :png] The format for the thumbnail image, jpeg
    #   (default) or png. For images that are photos, jpeg should be preferred,
    #   while png is better for screenshots and digital arts. The default is
    #   :jpeg.
    # @option size [:w32h32, :w64h64, :w128h128, :w640h480, :w1024h768] The
    #   size for the thumbnail image. The default is :w64h64
    def get_thumbnail(path, options = {})
      options[:format] ||= :jpg
      options[:size] ||= :w64h64

      request :post, "/2/files/get_thumbnail", {
        :path => path,
        :format => options[:format],
        :size => options[:size]
      }
    end

    # Returns the contents of a folder.
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
    def list_folder(path, options = {})
      options[:recursive] ||= false
      options[:include_media_info] ||= false
      options[:include_deleted] ||= false

      request :post, "/2/files/list_folder", {
        :path => path,
        :recursive => options[:recursive],
        :include_media_info => options[:include_media_info],
        :include_deleted => options[:include_deleted]
      }
    end

    # Once a cursor has been retrieved from list_folder, use this to paginate
    # through all files and retrieve updates to the folder.
    #
    # @param cursor [String] The cursor returned by your last call to
    #   list_folder or list_folder_continue.
    def list_folder_continue(cursor)
      request :post, "/2/files/list_folder/continue", {
        :cursor => cursor
      }
    end

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
    def list_folder_get_latest_cursor(path, options = {})
      options[:recursive] ||= false
      options[:include_media_info] ||= false
      options[:include_deleted] ||= false

      request :post, "/2/files/list_folder/get_latest_cursor", {
        :path => path,
        :recursive => options[:recursive],
        :include_media_info => options[:include_media_info],
        :include_deleted => options[:include_deleted]
      }
    end

    # A longpoll endpoint to wait for changes on an account. In conjunction
    # with list_folder, this call gives you a low-latency way to monitor an
    # account for file changes. The connection will block until there are
    # changes available or a timeout occurs. This endpoint is useful mostly
    # for client-side apps. If you're looking for server-side notifications,
    # check out our webhooks documentation.
    #
    # @param cursor [String] A cursor as returned by list_folder or
    #   list_folder_continue.
    # @option timeout [Numeric] A timeout in seconds. The request will block
    # for at most this length of time, plus up to 90 seconds of random jitter
    # added to avoid the thundering herd problem. Care should be taken when
    # using this parameter, as some network infrastructure does not support
    # long timeouts. The default for this field is 30.
    def list_folder_longpoll(cursor, options = {})
      options[:timeout] ||= 30

      request :post, "/2/files/list_folder/longpoll", {
        :cursor => cursor,
        :timeout => options[:timeout]
      }
    end

    # Return revisions of a file
    #
    # @param path [String] The path to file you want to see the revisions of.
    # @option limit [Numeric] The maximum number of revision entries returned.
    #   The default for this field is 10.
    def list_revisions(path, options = {})
      options[:limit] ||= 10

      request :post, "/2/files/list_revisions", {
        :path => path,
        :limit => options[:limit]
      }
    end

    # Move a file or folder to a different location in the user's Dropbox.
    #
    # If the source path is a folder all its contents will be moved.
    #
    # @param from [String] Path in the user's Dropbox to be copied or moved.
    # @param to [String] Path in the user's Dropbox that is the destination.
    def move(from, to)
      request :post, "/2/files/move", {
        :from_path => from,
        :to_path => to
      }
    end

    # Restore a file to a specific revision
    #
    # @param path [String] The path to the file you want to restore.
    # @param rev [String] The revision to restore for the file.
    def restore(path, rev)
      request :post, "/2/files/move", {
        :path => path,
        :rev => rev
      }
    end

    # Searches for files and folders.
    #
    # Note: Recent changes may not immediately be reflected in search results
    # due to a short delay in indexing.
    #
    # @param query [String] The string to search for. The search string is
    #   split on spaces into multiple tokens. For file name searching, the last
    #   token is used for prefix matching (i.e. "bat c" matches "bat cave" but
    #   not "batman car").
    # @param path [String] The path in the user's Dropbox to search.
    # @option start [Numeric] The starting index within the search results
    #   (used for paging). The default for this field is 0.
    # @option max_results [Numeric] The maximum number of search results to
    #   return. The default for this field is 100.
    # @option mode [:filename, :filename_and_content, :deleted_filename] The
    #   search mode. Note that searching file content is only available for
    #   Dropbox Business accounts. The default is filename.
    def search(query, path = "", options = {})
      options[:start] ||= 0
      options[:max_results] ||= 100
      options[:mode] ||= :filename

      request :post, "/2/files/search", {
        :path => path,
        :query => query,
        :start => options[:start],
        :max_results => options[:max_results],
        :mode => options[:mode]
      }
    end
  end
end
