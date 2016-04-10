module DropboxApiV2::Errors
  class BasicError < StandardError
    def self.build(metadata)
      self.new
    end
  end

  class CantCopySharedFolderError < BasicError; end
  class CantMoveFolderIntoItselfError < BasicError; end
  class CantNestSharedFolderError < BasicError; end
  class DisallowedNameError < BasicError; end
  class FileConflictError < BasicError; end
  class FileAncestorConflictError < BasicError; end
  class FolderConflictError < BasicError; end
  class InsufficientSpaceError < BasicError; end
  class MalformedPathError < BasicError; end
  class NotFileError < BasicError; end
  class NotFolderError < BasicError; end
  class NotFoundError < BasicError; end
  class NoWritePermissionError < BasicError; end
  class RestrictedContentError < BasicError; end
  class TooManyFilesError < BasicError; end
end
