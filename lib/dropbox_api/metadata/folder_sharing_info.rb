module DropboxApi::Metadata
  # NOTE: We should have a test to cover the initialization of this object.
  # Sample:
  # {
  #   "read_only": false,
  #   "parent_shared_folder_id": "84528192421"
  # }
  class FolderSharingInfo < Base
    field :read_only, :boolean
    field :parent_shared_folder_id, String, :optional
    field :shared_folder_id, String, :optional
  end
end
