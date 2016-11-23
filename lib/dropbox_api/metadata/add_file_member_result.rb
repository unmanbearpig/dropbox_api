module DropboxApi::Metadata
  # Example of a {AddFileMemberResult}:
  #   {
  #     "member":{
  #       ".tag": "email",
  #       "email": "somebody@test.com"
  #     },
  #     "result": {
  #       ".tag": "success",
  #       "success": {
  #         ".tag": "viewer"
  #       }
  #     }
  #   }
  class AddFileMemberResult < Base
    field :member, DropboxApi::Metadata::Member
    field :result, DropboxApi::Metadata::FileMemberAction
  end
end
