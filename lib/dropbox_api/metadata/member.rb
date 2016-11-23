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
  class Member < Base
    class << self
      def build_from_email_or_dropbox_id(email_or_id)
        if email_or_id.start_with? "dbid:"
          build_from_dropbox_id email_or_id
        elsif email_or_id =~ /\A[^@\s]+@[^@\s]+\z/
          build_from_email email_or_id
        else
          raise ArgumentError, "Invalid email or Dropbox ID: #{email_or_id}"
        end
      end

      def build_from_dropbox_id(dropbox_id)
        new({
          :".tag" => :dropbox_id,
          :dropbox_id => dropbox_id
        })
      end

      def build_from_email(email)
        new({
          :".tag" => :email,
          :email => email
        })
      end
    end

    def initialize(member)
      @member = member
    end

    def to_hash
      @member
    end
  end
end
