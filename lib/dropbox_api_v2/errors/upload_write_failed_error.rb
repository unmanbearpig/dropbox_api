module DropboxApiV2::Errors
  class UploadWriteFailedError < BasicError
    ErrorSubtypes = {
      :reason => WriteError
    }.freeze
  end
end
