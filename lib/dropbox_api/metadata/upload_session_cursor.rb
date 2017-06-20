module DropboxApi::Metadata
  # Example of a serialized {UploadSessionCursor} object:
  #   {
  #     "session_id": "AAAAAAAABCJ61k9yZZtn8Q",
  #     "offset":9
  #   }
  class UploadSessionCursor < Base
    field :session_id, String
    field :offset, Integer

    def offset=(n)
      self[:offset] = n
    end
  end
end
