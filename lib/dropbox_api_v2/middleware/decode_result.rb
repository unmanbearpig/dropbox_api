module DropboxApiV2::MiddleWare
  class DecodeResult < Faraday::Middleware
    def call(rq_env)
      @app.call(rq_env).on_complete do |rs_env|
        if !rs_env[:response_headers]['Dropbox-Api-Result'].nil?
          rs_env[:api_result] = decode rs_env[:response_headers]['Dropbox-Api-Result']
        elsif rs_env[:response_headers]['content-type'] == 'application/json'
          rs_env[:api_result] = decode rs_env[:body]
        end
      end
    end

    def decode(json)
      JSON.parse json
    end
  end

  Faraday::Response.register_middleware :decode_result => DecodeResult
end
