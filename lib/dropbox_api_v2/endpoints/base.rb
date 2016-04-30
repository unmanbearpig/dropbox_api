module DropboxApiV2::Endpoints
  class Base
    def initialize(connection)
      @connection = connection
    end

    protected

    def self.add_endpoint(name, *params)
      DropboxApiV2::Client.add_endpoint(name, *params, self)
    end

    def perform_request(method, params)
      response = @connection.run_request(method, self.class::Path, params, {})
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
