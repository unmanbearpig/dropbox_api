module DropboxApiV2::Errors
  class ListRevisionsError < BasicError
    ErrorSubtypes = {
      :path => LookupError
    }.freeze
  end
end
