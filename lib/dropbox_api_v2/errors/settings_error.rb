module DropboxApiV2::Errors
  class SettingsError < BasicError
    ErrorSubtypes = {
      :invalid_settings => InvalidSettingsError,
      :not_authorized => NoPermissionError
    }.freeze
  end
end
