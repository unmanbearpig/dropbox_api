module DropboxApiV2::Errors
  class UploadError < BasicError
    ErrorSubtypes = {
      :path => UploadWriteFailedError
    }.freeze
  end
end
