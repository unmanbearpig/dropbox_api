module DropboxApiV2::Metadata
  class Factory
    def self.build(data, discriminator)
      self.new(data, discriminator).build
    end

    def initialize(data, discriminator)
      @data = data
      @discriminator = discriminator
    end

    def build
      datatype_class.new @data
    end

    private

    def datatype_class
      {
        :file => File
      }[datatype]
    end

    def datatype
      case @discriminator
      when :file_or_folder
        @data[".tag"].to_sym
      when :file, :folder
        @discriminator
      else
        raise ArgumentError, "Unknown datatype `#{@datatype}`"
      end
    end
  end
end
