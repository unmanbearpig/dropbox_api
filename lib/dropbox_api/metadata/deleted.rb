module DropboxApi::Metadata
  # NOTE: We should have a test to cover the initialization of this object.
  # Sample:
  # {
  #   ".tag": "deleted",
  #   "name": "file.txt",
  #   "path_lower": "/file.txt",
  #   "path_display": "/file.txt"
  # }
  class Deleted < Base
    field :name, String
    field :path_lower, String
    field :path_display, String
  end
end
