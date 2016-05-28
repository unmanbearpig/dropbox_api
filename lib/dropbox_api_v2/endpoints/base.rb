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
      result_builder = DropboxApiV2::ResultBuilder.new(raw_response.env[:api_result])

      if result_builder.has_error?
        raise result_builder.build_error(self.class::ErrorType)
      else
        result_builder.build(self.class::ResultType)
      end
    end
  end
end
