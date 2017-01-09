module DropboxApi::Metadata
  class CommitInfo < Base
    field :path, String
    field :mode, DropboxApi::Metadata::WriteMode
    field :autorename, :boolean, :optional
    field :client_modified, Time, :optional
    field :mute, :boolean, :optional
  end
end
