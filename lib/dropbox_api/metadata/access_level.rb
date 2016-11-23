module DropboxApi::Metadata
  # Example of a serialized {AccessLevel} object:
  #   {
  #     ".tag": "viewer"
  #   }
  class AccessLevel
    def self.new(data)
      data[".tag"].to_sym
    end
  end
end
