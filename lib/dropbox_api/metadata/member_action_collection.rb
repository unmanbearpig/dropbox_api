module DropboxApi::Metadata
  # This represents a collection of actions that may be taken on members of a
  # shared folder. Each action will be one of the following:
  #
  # - leave_a_copy: Allow the member to keep a copy of the folder when removing.
  # - make_editor: Make the member an editor of the folder.
  # - make_owner: Make the member an owner of the folder.
  # - make_viewer: Make the member a viewer of the folder.
  # - make_viewer_no_comment: Make the member a viewer of the folder without commenting permissions.
  # - remove: Remove the member from the folder.
  #
  # TODO: Split this object in two: MemberAction & MemberActionList,
  #       DropboxApi::Metadata::MemberPermission will use it.
  class MemberActionCollection < Array
    ValidActions = [
      :leave_a_copy,
      :make_editor,
      :make_owner,
      :make_viewer,
      :make_viewer_no_comment,
      :remove
    ]

    def initialize(actions)
      actions = symbolize actions
      validate actions

      super(actions)
    end

    private

    def symbolize(actions)
      actions.map &:to_sym
    end

    def validate(actions)
      actions.each do |action|
        raise ArgumentError,
          "Invalid action: `#{action}`" unless ValidActions.include? action
      end
    end
  end
end
