module DropboxApi::Metadata
  class Base
    def self.field(name, type, *options)
      @fields ||= {}
      @fields[name] = DropboxApi::Metadata::Field.new(type, options)

      attr_reader name
    end

    def self.each_field
      @fields.each do |name, field|
        yield name, field
      end
    end

    def initialize(metadata)
      self.class.each_field do |name, field|
        instance_variable_set "@#{name}", field.cast(metadata[name.to_s])
      end
    end
  end
end
