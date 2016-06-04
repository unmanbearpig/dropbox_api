module DropboxApiV2::Endpoints::Files
  class GetPreview < DropboxApiV2::Endpoints::ContentDownload
    Method      = :post
    Path        = "/2/files/get_preview".freeze
    ResultType  = DropboxApiV2::Metadata::File
    ErrorType   = DropboxApiV2::Errors::PreviewError

    # @method get_preview(path)
    # Get a preview for a file. Currently previews are only generated for the
    # files with the following extensions: .doc, .docx, .docm, .ppt, .pps,
    # .ppsx, .ppsm, .pptx, .pptm, .xls, .xlsx, .xlsm, .rtf
    #
    # @param path [String] The path of the file to preview.
    add_endpoint :get_preview do |path|
      perform_request({:path => path})
    end
  end
end
