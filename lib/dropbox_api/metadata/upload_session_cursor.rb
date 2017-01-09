module DropboxApi::Metadata
  # Example of a serialized {UploadSessionCursor} object:
  #   {
  #     ???
  #   }
  class UploadSessionCursor < Base
    field :session_id, String
    field :offset, Integer
  end
end
