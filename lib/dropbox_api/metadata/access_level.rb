module DropboxApi::Metadata
  # Example of a serialized {AccessLevel} object:
  #   {
  #     ".tag": "viewer"
  #   }
  class AccessLevel < Base
    def self.new(data)
      case data
      when Symbol
        data
      when Hash
        data[".tag"].to_sym
      else
        raise ArgumentError, "Invalid value for AccessLevel: #{data.inspect}."
      end
    end
  end
end
