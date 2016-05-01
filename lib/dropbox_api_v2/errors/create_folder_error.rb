module DropboxApiV2::Errors
  class CreateFolderError < BasicError
    ErrorSubtypes = {
      :path => WriteError
    }.freeze
  end
end
