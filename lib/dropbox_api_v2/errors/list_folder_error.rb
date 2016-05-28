module DropboxApiV2::Errors
  class ListFolderError < BasicError
    ErrorSubtypes = {
      :path => LookupError
    }.freeze
  end
end
