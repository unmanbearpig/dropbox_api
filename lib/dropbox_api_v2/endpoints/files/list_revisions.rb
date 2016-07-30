module DropboxApiV2::Endpoints::Files
  class ListRevisions < DropboxApiV2::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/list_revisions".freeze
    ResultType  = DropboxApiV2::Results::ListRevisionsResult
    ErrorType   = DropboxApiV2::Errors::ListRevisionsError

    include DropboxApiV2::Endpoints::OptionsValidator

    # @method list_revisions(path, options = {})
    # Return revisions of a file
    #
    # @param path [String] The path to file you want to see the revisions of.
    # @option limit [Numeric] The maximum number of revision entries returned.
    #   The default for this field is 10.
    add_endpoint :list_revisions do |path, options = {}|
      validate_options([
        :limit
      ], options)
      options[:limit] ||= 10

      perform_request options.merge({
        :path => path
      })
    end
  end
end
