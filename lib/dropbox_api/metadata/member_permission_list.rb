module DropboxApi::Metadata
  class MemberPermissionList < Array
    def initialize(list)
      super(list.map { |i| DropboxApi::Metadata::MemberPermission.new i })
    end
  end
end
