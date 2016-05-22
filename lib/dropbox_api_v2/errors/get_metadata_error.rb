module DropboxApiV2::Errors
  class GetMetadataError < BasicError
    ErrorSubtypes = {
      :path => LookupError
    }.freeze
  end
end
