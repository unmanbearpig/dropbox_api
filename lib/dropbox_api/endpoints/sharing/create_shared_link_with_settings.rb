module DropboxApi::Endpoints::Sharing
  class CreateSharedLinkWithSettings < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = "/2/sharing/create_shared_link_with_settings".freeze
    ResultType  = DropboxApi::Metadata::SharedLink
    ErrorType   = DropboxApi::Errors::CreateSharedLinkWithSettingsError

    # @method create_shared_link_with_settings(path, settings = {})
    # Create a shared link with custom settings. If no settings are given then
    # the default visibility is :public. (The resolved
    # visibility, though, may depend on other aspects such as team and shared
    # folder settings).
    #
    # @param path [String]
    # @option settings [SharedLinkSettings]
    # @return [DropboxApi::Metadata::SharedLink]
    add_endpoint :create_shared_link_with_settings do |path, settings = {}|
      # NOTE: This endpoint accepts an additional option `settings` which
      #       hasn't been implemented.
      perform_request :path => path
    end
  end
end
