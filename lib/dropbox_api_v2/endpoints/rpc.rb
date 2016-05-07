module DropboxApiV2::Endpoints
  class Rpc < DropboxApiV2::Endpoints::Base
    def self.connection_type
      :rpc
    end
  end
end
