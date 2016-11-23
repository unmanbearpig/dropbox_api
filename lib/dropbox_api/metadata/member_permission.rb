module DropboxApi::Metadata
  class MemberPermission < Base
    field :action, String # This is actually a MemberAction object
    field :allow, :boolean
    field :reason, String # This is actually a PermissionDeniedReason object
  end
end
