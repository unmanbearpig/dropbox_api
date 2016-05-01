module DropboxApiV2::Metadata
  class Base
    def self.field(name, type)
      @fields ||= {}
      @fields[name] = type

      attr_reader name
    end

    def self.each_field
      @fields.each do |name, type|
        yield name, type
      end
    end

    def initialize(metadata)
      self.class.each_field do |name, type|
        instance_variable_set "@#{name}", cast(metadata[name.to_s], type)
      end
    end

    private

    def cast(object, type)
      if type == String
        object
      elsif type == Time
        Time.new(object)
      elsif type == Integer
        object.to_i
      else
        raise NotImplementedError, "Can't cast `#{type}`"
      end
    end
  end
end
