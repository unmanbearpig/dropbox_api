module DropboxApiV2::Results
  class SharedFolderMembers < DropboxApiV2::Results::Base
    def users
      @data["users"]
    end

    def groups
      @data["groups"]
    end

    def invitees
      @data["invitees"]
    end

    def cursor
      @data["cursor"]
    end
  end
end
