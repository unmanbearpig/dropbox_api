module DropboxApiV2
  class ResponseCaster
    def initialize(response_data)
      @response_data = response_data
    end

    def as(expected_type)
      send expected_type
    end

    private

    def file_or_folder
      send @response_data[".tag"]
    end

    def file
      DropboxApiV2::Metadata::File.new @response_data
    end
  end
end
