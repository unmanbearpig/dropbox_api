module DropboxApiV2
  class ResponseProcessor
    # NOTE: This class is expected to implement the logic required to handle
    # errors.
    def initialize(response_data)
      @response_data = response_data
    end

    def cast_as(expected_type)
      Metadata::Factory.build @response_data, expected_type
    end
  end
end
