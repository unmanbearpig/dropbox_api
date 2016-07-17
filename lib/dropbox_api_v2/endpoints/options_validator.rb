module DropboxApiV2::Endpoints
  module OptionsValidator
    def validate_options(valid_option_keys, options)
      options.keys.each do |key|
        unless valid_option_keys.include? key.to_sym
          raise ArgumentError, "Invalid option `#{key}`"
        end
      end
    end
  end
end
