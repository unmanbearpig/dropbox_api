module DropboxApi::Endpoints::Users
  class GetCurrentAccount < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = "/2/users/get_current_account".freeze
    ResultType  = DropboxApi::Metadata::BasicAccount
    ErrorType   = nil

    # @method get_current_account
    # Get information about the current user's account.
    #
    # @return [BasicAccount] Detailed information about the current user's account.
    add_endpoint :get_current_account do
      perform_request nil
    end
  end
end
