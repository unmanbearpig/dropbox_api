module DropboxApiV2::Endpoints::Sharing
  class AddFolderMember < DropboxApiV2::Endpoints::Rpc
    Method      = :post
    Path        = "/2/sharing/add_folder_member".freeze
    ResultType  = DropboxApiV2::Results::VoidResult
    ErrorType   = DropboxApiV2::Errors::AddFolderMemberError

    # @method add_folder_member(folder_id, members, options)
    # Allows an owner or editor (if the ACL update policy allows) of a shared
    # folder to add another member.
    #
    # For the new member to get access to all the functionality for this folder,
    # you will need to call mount_folder on their behalf.
    #
    # Apps must have full Dropbox access to use this endpoint.
    #
    # @param folder_id [String] The ID for the shared folder.
    # @param members [Array<AddMember,String>] The intended list of members to
    #   add. Added members will receive invites to join the shared folder.
    # @option quiet [Boolean] Whether added members should be notified via
    #   email and device notifications of their invite. The default for this
    #   field is False.
    # @option custom_message [String] Optional message to display to added
    #   members in their invitation. This field is optional.
    add_endpoint :add_folder_member do |folder_id, members, options = {}|
      # TODO: It should be possible to take an email (String) as the argument.
      validate_options(options)
      options[:quiet] ||= false
      options[:custom_message] ||= nil

      perform_request options.merge({
        :shared_folder_id => folder_id,
        :members => build_members_param(members)
      })
    end

    private

    def build_members_param(members)
      members.map do |member|
        case member
        when String
          DropboxApiV2::Metadata::AddMember.new member
        when DropboxApiV2::Metadata::AddMember
          member
        else
          raise ArgumentError, "Invalid argument type `#{member.class.name}`"
        end
      end.map(&:to_hash)
    end

    def validate_options(options)
      valid_option_keys = [
        :quiet,
        :custom_message
      ]

      options.keys.each do |key|
        unless valid_option_keys.include? key.to_sym
          raise ArgumentError, "Invalid option `#{key}`"
        end
      end
    end
  end
end
