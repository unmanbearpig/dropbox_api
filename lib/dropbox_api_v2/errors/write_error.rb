module DropboxApiV2::Errors
  class WriteError < BasicError
    def self.build(metadata)
      discriminator = metadata[".tag"]
      case discriminator
      when "malformed_path"
        MalformedPathError.build(metadata[discriminator])
      when "conflict"
        WriteConflictError.build(metadata[discriminator])
      when "no_write_permission"
        NoWritePermissionError.build(metadata[discriminator])
      when "insufficient_space"
        InsufficientSpaceError.build(metadata[discriminator])
      when "disallowed_name"
        DisallowedNameError.build(metadata[discriminator])
      end
    end
  end
end
