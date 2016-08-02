module DropboxApi::Metadata
  # NOTE: We should have a test to cover the initialization of this object.
  # Sample:
  # {
  #   "can_revoke": false,
  #   "resolved_visibility": {
  #     ".tag": "public"
  #   },
  #   "revoke_failure_reason": {
  #     ".tag": "owner_only"
  #   }
  # }
  class LinkPermissions < Base
    field :can_revoke, :boolean
    field :resolved_visibility, Symbol, :optional
    field :requested_visibility, Symbol, :optional
    field :revoke_failure_reason, Symbol, :optional
  end
end
