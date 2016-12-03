module DropboxApi::Endpoints::Sharing
  class AddFileMember < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = "/2/sharing/add_file_member".freeze
    ResultType  = DropboxApi::Results::AddFileMemberResultList
    ErrorType   = DropboxApi::Errors::AddFileMemberError

    include DropboxApi::Endpoints::OptionsValidator

    # @method add_file_member(file, members, options = {})
    # Adds specified members to a file.
    #
    # The +members+ parameter must be an Array. Each item in the array could
    # be either a String or a {Metadata::Member} object, which allows more
    # advanced options.
    #
    # @param file [String] File to which to add members. It can be a path or
    #   an ID such as +id:3kmLmQFnf1AAAAAAAAAAAw+.
    # @param members [Array<Member,String>] Members to add. Note that even
    #   an email address is given, this may result in a user being directy
    #   added to the membership if that email is the user's main account email.
    # @option options quiet [Boolean] Whether added members should be notified
    #   via email and device notifications of their invite. The default for
    #   this field is +false+.
    # @option options custom_message [String] Message to send to added members
    #   in their invitation. This field is optional.
    # @option options access_level [AccessLevel] AccessLevel union object,
    #   describing what access level we want to give new members. The default
    #   for this is +:viewer+.
    # @option options add_message_as_comment [String] Optional message to
    #   display to added members in their invitation. This field is optional.
    add_endpoint :add_file_member do |file, members, options = {}|
      validate_options([:quiet, :custom_message, :access_level, :add_message_as_comment], options)
      options[:quiet] ||= false
      options[:custom_message] ||= nil
      options[:access_level] ||= :viewer
      options[:add_message_as_comment] ||= false

      perform_request options.merge({
        :file => file,
        :members => build_members_param(members)
      })
    end

    private

    def build_members_param(members)
      Array(members).map do |member|
        case member
        when String
          DropboxApi::Metadata::Member.build_from_email_or_dropbox_id member
        when DropboxApi::Metadata::Member
          member
        else
          raise ArgumentError, "Invalid argument type `#{member.class.name}`"
        end
      end.map(&:to_hash)
    end
  end
end
