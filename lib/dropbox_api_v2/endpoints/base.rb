module DropboxApiV2::Endpoints
  class Base
    def self.add_endpoint(name, &block)
      define_method(name, block)
      DropboxApiV2::Client.add_endpoint(name, self)
    end

    protected

    def run_request(params)
      @connection.run_request(self.class::Method, self.class::Path, params, {})
    end

    def perform_request(params)
      process_response(run_request(params))
    end

    def process_response(raw_response)
      case raw_response.status
      when 200, 409
        # Status code 409 is "Endpoint-specific error". We need to look at
        # the response body to build an exception.
        build_result(raw_response.env[:api_result])
      else
        raise raw_response.body
      end
    end

    def build_result(api_result)
      result_builder = DropboxApiV2::ResultBuilder.new(api_result)

      if result_builder.has_error?
        raise result_builder.build_error(self.class::ErrorType)
      else
        result_builder.build(self.class::ResultType)
      end
    end
  end
end
