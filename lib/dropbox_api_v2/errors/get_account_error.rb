module DropboxApiV2::Errors
  class GetAccountError < BasicError
    ErrorSubtypes = {
      :no_account => NoAccountError
    }.freeze
  end
end
