module DropboxApiV2::Errors
  class DownloadError < BasicError
    ErrorSubtypes = {
      :path => LookupError
    }.freeze
  end
end
