module DropboxApi::Metadata
  class SpaceAllocation < Base
    # Sample:
    # {
    #   ".tag": "individual",
    #   "allocated": 2147483648
    # }
    field :allocated, Integer
  end
end
