module DropboxApi::Metadata
  # Examples of serialized {AddMember} objects:
  #   {
  #     "member": {
  #       ".tag": "email",
  #       "email": "justin@example.com"
  #     },
  #     "access_level": {
  #       ".tag": "editor"
  #     }
  #   },
  #   {
  #     "member": {
  #       ".tag": "dropbox_id",
  #       "dropbox_id": "dbid:AAEufNrMPSPe0dMQijRP0N_aZtBJRm26W4Q"
  #     },
  #     "access_level": {
  #       ".tag": "viewer"
  #     }
  #   }
  class AddMember
    # Builds an AddMember object that can be used as an argument for
    # `add_folder_member`.
    #
    # @param member [String] Email address or Dropbox ID.
    # @param acl [:editor, :viewer] Access level, defaults to :editor.
    def initialize(member, acl = :editor)
      @member = Member.build_from_email_or_dropbox_id(member)
      @acl = acl
    end

    def to_hash
      {
        :member => @member.to_hash,
        :access_level => acl_to_hash
      }
    end

    private

    def acl_to_hash
      {
        :".tag" => @acl
      }
    end
  end
end
