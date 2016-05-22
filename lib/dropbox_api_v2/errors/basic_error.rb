module DropboxApiV2::Errors
  class BasicError < StandardError
    class << self
      def build(metadata, message)
        subtype, metadata = find_subtype metadata

        if subtype.nil?
          new message
        else
          subtype.build metadata, message
        end
      end

      def find_subtype(metadata)
        if defined? self::ErrorSubtypes
          discriminator = metadata[".tag"]
          [self::ErrorSubtypes[discriminator.to_sym], metadata[discriminator]]
        else
          [nil, metadata]
        end
      end
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
  class InProgressError < BasicError; end
  class UnsupportedExtensionError < BasicError; end
  class UnsupportedContentError < BasicError; end
end
