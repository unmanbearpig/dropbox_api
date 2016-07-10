module DropboxApiV2::Endpoints
  class ContentDownload < DropboxApiV2::Endpoints::Base
    def initialize(builder)
      @connection = builder.build("https://content.dropboxapi.com") do |c|
        c.request :encode_args_in_headers
        c.response :decode_result
      end
    end

    def perform_request(params, &block)
      response = run_request(params)
      api_result = process_response(response)

      # TODO: Stream response, current implementation will fail with very large
      #       files.
      block.call(response.body) unless block.nil?

      api_result
    end
  end
end
