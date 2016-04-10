module DropboxApiV2::Errors
  class RelocationError < BasicError
    def self.build(metadata)
      discriminator = metadata[".tag"]
      case discriminator
      when "from_lookup"
        LookupError.build(metadata[discriminator])
      when "from_write"
        WriteError.build(metadata[discriminator])
      when "to"
        WriteError.build(metadata[discriminator])
      when "cant_copy_shared_folder"
        CantCopySharedFolderError.build(metadata[discriminator])
      when "cant_nest_shared_folder"
        CantNestSharedFolderError.build(metadata[discriminator])
      when "cant_move_folder_into_itself"
        CantMoveFolderIntoItselfError.build(metadata[discriminator])
      when "too_many_files"
        TooManyFilesError.build(metadata[discriminator])
      end
    end
  end
end
