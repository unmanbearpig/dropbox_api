module DropboxApiV2::Errors
  class LookupError < BasicError
    def self.build(metadata)
      discriminator = metadata[".tag"]
      case discriminator
      when "malformed_path"
        MalformedPathError.build(metadata[discriminator])
      when "not_found"
        NotFoundError.build(metadata[discriminator])
      when "not_file"
        NotFileError.build(metadata[discriminator])
      when "not_folder"
        NotFolderError.build(metadata[discriminator])
      when "restricted_content"
        RestrictedContentError.build(metadata[discriminator])
      end
    end
  end
end
