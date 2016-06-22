module DropboxApiV2::Metadata
  class FolderLink < Base
    field :url, String
    field :name, String
    field :link_permissions, DropboxApiV2::Metadata::LinkPermissions
    field :id, String, :optional
    field :expires, Time, :optional
    field :path_lower, String, :optional
    field :team_member_info, DropboxApiV2::Metadata::TeamMemberInfo, :optional
    field :content_owner_team_info, DropboxApiV2::Metadata::Team, :optional
  end
end
