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

  class BadPathError < BasicError; end
  class CantCopySharedFolderError < BasicError; end
  class CantMoveFolderIntoItselfError < BasicError; end
  class CantNestSharedFolderError < BasicError; end
  class CantShareOutsideTeamError < BasicError; end
  class DisallowedNameError < BasicError; end
  class DisallowedSharedLinkPolicyError < BasicError; end
  class EmailUnverifiedError < BasicError; end
  class FileConflictError < BasicError; end
  class FileAncestorConflictError < BasicError; end
  class FolderConflictError < BasicError; end
  class GroupDeletedError < BasicError; end
  class GroupNotOnTeamError < BasicError; end
  class InProgressError < BasicError; end
  class InsufficientPlanError < BasicError; end
  class InsufficientSpaceError < BasicError; end
  class InvalidCursorError < BasicError; end
  class InvalidDropboxIdError < BasicError; end
  class InvalidEmailError < BasicError; end
  class InvalidIdError < BasicError; end
  class MalformedPathError < BasicError; end
  class NotFileError < BasicError; end
  class NotAMemberError < BasicError; end
  class NotFolderError < BasicError; end
  class NotFoundError < BasicError; end
  class NoPermissionError < BasicError; end
  class NoWritePermissionError < BasicError; end
  class RateLimitError < BasicError; end
  class RestrictedContentError < BasicError; end
  class TeamFolderError < BasicError; end
  class TeamPolicyDisallowsMemberPolicyError < BasicError; end
  class TooManyFilesError < BasicError; end
  class TooManyMembersError < BasicError; end
  class TooManyPendingInvitesError < BasicError; end
  class UnmountedError < BasicError; end
  class UnsupportedExtensionError < BasicError; end
  class UnsupportedContentError < BasicError; end
  class UnverifiedDropboxId < BasicError; end
end
