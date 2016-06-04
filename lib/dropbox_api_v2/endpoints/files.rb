module DropboxApiV2::Endpoints
  module Files
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
