module DropboxApi::Endpoints::Files
  class UploadSessionAppendV2 < DropboxApi::Endpoints::ContentUpload
    Method      = :post
    Path        = "/2/files/upload_session/append_v2".freeze
    ResultType  = DropboxApi::Results::VoidResult
    ErrorType   = DropboxApi::Errors::UploadSessionLookupError

    include DropboxApi::Endpoints::OptionsValidator

    # Append more data to an upload session.
    #
    # When the parameter +close+ is set, this call will close the session.
    #
    # A single request should not upload more than 150 MB of file contents.
    #
    # @param cursor [DropboxApi::Metadata::UploadSessionCursor] Contains the
    #   upload session ID and the offset.
    # @option options close [Boolean] If +true+, the current session will be
    #   closed, at which point you won't be able to call
    #   {Client#upload_session_append_v2} anymore with the current session.
    #   The default for this field is +false+.
    # @see UploadSessionCursor
    add_endpoint :upload_session_append_v2 do |cursor, content, options = {}|
      validate_options([
        :close
      ], options)

      perform_request(options.merge({
        :cursor => cursor.to_hash
      }), content)
    end
  end
end
