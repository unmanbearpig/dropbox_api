module DropboxApiV2::Endpoints::Users
  class GetAccount < DropboxApiV2::Endpoints::Rpc
    Method      = :post
    Path        = "/2/users/get_account".freeze
    ResultType  = DropboxApiV2::Metadata::BasicAccount
    ErrorType   = DropboxApiV2::Errors::GetAccountError

    # @method get_account(account_id)
    # Get information about a user's account.
    #
    # @param account_id [String] A user's account identifier.
    # @return [BasicAccount] Basic information about any account.
    add_endpoint :get_account do |account_id|
      perform_request :account_id => account_id
    end
  end
end
