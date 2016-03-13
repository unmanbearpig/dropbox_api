module DropboxApiV2
  class Client
    def initialize(oauth_bearer = ENV["DROPBOX_OAUTH_BEARER"])
      @connection = Faraday.new(:url => "https://api.dropboxapi.com") do |c|
        c.authorization :Bearer, oauth_bearer
        c.request :encode_json
        c.response :decode_json
        c.adapter Faraday.default_adapter
      end
    end

    # First method, just as a sample
    def list_folder(path)
      response = @connection.run_request(:post, "/2/files/list_folder", {:path => path}, nil)
      response.body
    end
  end
end
