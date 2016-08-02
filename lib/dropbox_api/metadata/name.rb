module DropboxApi::Metadata
  # NOTE: We should have a test to cover the initialization of this object.
  # Sample:
  # {
  #     "given_name": "Franz",
  #     "surname": "Ferdinand",
  #     "familiar_name": "Franz",
  #     "display_name": "Franz Ferdinand (Personal)"
  # },
  class Name < Base
    field :given_name, String
    field :surname, String
    field :familiar_name, String
    field :display_name, String
  end
end
