module DropboxApiV2::Errors
  class ListFolderLongpollError < BasicError
    ErrorSubtypes = {
      :reset => InvalidCursorError
    }.freeze
  end
end
