module DropboxApiV2::Errors
  class WriteConflictError < BasicError
    def self.build(metadata)
      discriminator = metadata[".tag"]
      case discriminator
      when "file"
        FileConflictError.build(metadata[discriminator])
      when "folder"
        FolderConflictError.build(metadata[discriminator])
      when "file_ancestor"
        FileAncestorConflictError.build(metadata[discriminator])
      end
    end
  end
end
