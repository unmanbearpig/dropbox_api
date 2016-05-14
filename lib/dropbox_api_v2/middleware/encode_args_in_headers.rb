module DropboxApiV2::MiddleWare
  class EncodeArgsInHeaders < Faraday::Middleware
    def call(env)
      if env[:body].is_a? Hash
        env[:request_headers]['Dropbox-API-Arg'] = encode env[:body]
        env[:request_headers]['Content-Type'] = ''

        env[:body] = nil
      end

      @app.call env
    end

    def encode(payload)
      JSON.dump payload
    end
  end

  Faraday::Request.register_middleware :encode_args_in_headers => EncodeArgsInHeaders
end
