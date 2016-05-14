module DropboxApiV2::Endpoints
  class Base
    def self.add_endpoint(name, &block)
      define_method(name, block)
      DropboxApiV2::Client.add_endpoint(name, self)
    end

    protected

    def perform_request(params, headers = {})
      process_response(@connection
        .run_request(self.class::Method, self.class::Path, params, headers))
    end

    def process_response(raw_response)
      api_result = DropboxApiV2::ApiResult.new(raw_response.env[:api_result])

      if api_result.has_error?
        raise api_result.build_error(self.class::ErrorType)
      else
        api_result.build_metadata(self.class::ResultType)
      end
    end
  end
end
