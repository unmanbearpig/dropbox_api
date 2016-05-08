module DropboxApiV2
  class ConnectionBuilder
    def initialize(oauth_bearer)
      @oauth_bearer = oauth_bearer
    end

    def build(url)
      Faraday.new(url) do |c|
        c.authorization :Bearer, @oauth_bearer

        yield c

        c.adapter Faraday.default_adapter
      end
    end
  end
end
