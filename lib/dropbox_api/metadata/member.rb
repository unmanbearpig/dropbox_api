module DropboxApi::Metadata
  # Examples of serialized {AddMember} objects:
  #   [
  #     {
  #       ".tag": "email",
  #       "email": "justin@example.com"
  #     },  {
  #       ".tag": "dropbox_id",
  #       "dropbox_id": "dbid:AAEufNrMPSPe0dMQijRP0N_aZtBJRm26W4Q"
  #     }
  #   ]
  class Member
    def initialize(email_or_id)
      if email_or_id.start_with? "dbid:"
        set_member_as_dropbox_id email_or_id
      elsif email_or_id =~ /\A[^@\s]+@[^@\s]+\z/
        set_member_as_email email_or_id
      else
        raise ArgumentError, "Invalid email or Dropbox ID: #{email_or_id}"
      end
    end

    def to_hash
      @member
    end

    private

    def set_member_as_dropbox_id(dropbox_id)
      @member = {
        :".tag" => :dropbox_id,
        :dropbox_id => dropbox_id
      }
    end

    def set_member_as_email(email)
      @member = {
        :".tag" => :email,
        :email => email
      }
    end
  end
end
