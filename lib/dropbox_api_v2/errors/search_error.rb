module DropboxApiV2::Errors
  class SearchError < BasicError
    ErrorSubtypes = {
      :path => LookupError
    }.freeze
  end
end
