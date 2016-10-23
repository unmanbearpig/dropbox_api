module DropboxApi::Metadata
  class SpaceUsage < Base
    # Sample:
    # {
    #   "used": 167685342,
    #   "allocation": {
    #     ".tag": "individual",
    #     "allocated": 2147483648
    #   }
    # }
    field :used, String
    field :allocation, DropboxApi::Metadata::SpaceAllocation
  end
end
