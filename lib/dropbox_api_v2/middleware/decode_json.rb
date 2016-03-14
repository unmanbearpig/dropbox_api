module DropboxApiV2::MiddleWare
  # If the body happens to be a `Hash`, it's encoded with JSON so it can be
  # sent.
  class DecodeJson < Faraday::Middleware
    def call(rq_env)
      @app.call(rq_env).on_complete do |rs_env|
        if rs_env[:response_headers]['content-type'] == 'application/json'
          rs_env[:body] = decode rs_env[:body]
        end
      end
    end

    def decode(json)
      JSON.parse json
    end
  end

  Faraday::Response.register_middleware :decode_json => DecodeJson
end
