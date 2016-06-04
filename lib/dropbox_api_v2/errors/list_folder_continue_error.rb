module DropboxApiV2::Errors
  class ListFolderContinueError < BasicError
    ErrorSubtypes = {
      :path => WriteError,
      :reset => InvalidCursorError
    }.freeze
  end
end
