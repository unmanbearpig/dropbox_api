module DropboxApiV2
  class ResultBuilder
    def initialize(response_data)
      @response_data = response_data
    end

    def error_summary
      @response_data["error_summary"]
    end

    def error
      @response_data["error"]
    end

    def has_error?
      !error_summary.nil?
    end

    def build(result_class)
      result_class.new(@response_data)
    end

    def build_error(error_type)
      error_type.build(error_summary, error)
    end
  end
end
