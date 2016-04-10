module DropboxApiV2
  class ResponseProcessor
    def initialize(response_data)
      @response_data = response_data
    end

    def cast_as(expected_type)
      if has_error?
        # NOTE: We need to build a proper error factory, the requester needs
        #       to indicate what error type is expected.
        raise Errors::RelocationError.build(error), error_summary
      else
        Metadata::Factory.build @response_data, expected_type
      end
    end

    private

    def error_summary
      @response_data["error_summary"]
    end

    def error
      @response_data["error"]
    end

    def has_error?
      !error_summary.nil?
    end
  end
end
