module DropboxApiV2::Results::Search
  class Match
    def initialize(data)
      @data = data
    end

    def match_type
      @data["match_type"]
    end

    def resource
      @resource ||= DropboxApiV2::Metadata::Resource.new @data["metadata"]
    end
  end
end
