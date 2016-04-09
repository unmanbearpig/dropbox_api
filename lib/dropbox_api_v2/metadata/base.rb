module DropboxApiV2::Metadata
  class Base
    @@fields = {}

    def initialize(metadata)
      @@fields.each do |field, type|
        instance_variable_set "@#{field}", cast(metadata[field.to_s], type)
      end
    end

    private

    def self.field(name, type)
      @@fields[name] = type

      attr_reader name
    end

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
