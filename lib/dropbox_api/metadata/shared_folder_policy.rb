module DropboxApi::Metadata
  # NOTE: We should have a test to cover the initialization of this object.
  # Sample:
  # {
  #   "acl_update_policy" => { ".tag" => "owner" },
  #   "shared_link_policy" => { ".tag" => "anyone" }
  # }
  class SharedFolderPolicy < Base
    field :acl_update_policy, Symbol
    field :shared_link_policy, Symbol
  end
end
