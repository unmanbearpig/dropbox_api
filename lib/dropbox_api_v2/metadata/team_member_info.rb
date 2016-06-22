module DropboxApiV2::Metadata
  # NOTE: We should have a test to cover the initialization of this object.
  # Sample:
  # {
  #   "team_info": {
  #     "id": "dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I",
  #     "name": "Acme, Inc."
  #   },
  #   "display_name": "Roger Rabbit",
  #   "member_id": "dbmid:abcd1234"
  # }
  class TeamMemberInfo < Base
    field :team_info, DropboxApiV2::Metadata::Team
    field :display_name, String
    field :member_id, String, :optional
  end
end
