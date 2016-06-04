module DropboxApiV2::Results
  class ShareFolderLaunch < DropboxApiV2::Results::Base
    def self.new(result_data)
      case result_data[".tag"]
      when "complete"
        DropboxApiV2::Metadata::SharedFolder.new result_data
      when "async_job_id"
        result_data
      else
        raise ArgumentError, "Unable to infer resource type for `#{tag}`"
      end
    end
  end
end
