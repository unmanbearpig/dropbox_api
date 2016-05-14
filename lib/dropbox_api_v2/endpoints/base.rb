module DropboxApiV2::Endpoints
  class Base
    def self.add_endpoint(name, &block)
      define_method(name, block)
      DropboxApiV2::Client.add_endpoint(name, self)
    end

    protected

    def perform_request(params, headers = {})
      response = @connection.run_request(self.class::Method, self.class::Path, params, headers)
      process_response response
    end

    def process_response(raw_response)
      response = DropboxApiV2::Response.new(raw_response.body)

      if response.has_error?
        raise response.build_error(self.class::ErrorType)
      else
        response.build_result(self.class::ResultType)
      end
    end
  end
end
