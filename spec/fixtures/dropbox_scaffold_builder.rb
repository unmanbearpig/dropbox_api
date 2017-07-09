# This class is useful to set up an existing Dropbox account in a state which
# is ready to pass the tests.
#
# For example, on the tests for the `delete` endpoint you may be deleting the
# file at `/delete/file.txt`, so we need to upload a file at that location or
# the test won't pass. That's exactly what {DropboxScaffoldBuilder#delete} is
# expected to do.
#
# Other endpoints' tests will have different requirements and this class is to
# provide an automated way to fulfill these. For each endpoint we need to test,
# you may have a method here that sets up everything that the tests for that
# endpoint needs.
#
# Note that, paradoxically, the methods here use the same methods we want to
# test. This shouldn't be a problem as the purpose of this is to allow us to
# regenerate the VCR cassettes, so if this automated mechanism fails you can
# always do the job manually and record the VCR cassette without using this.
#
# The Dropbox server may introduce minor changes over time so it's good to
# regenerate the cassettes every now and then, but we don't need to do it in
# every execution of the test suite.
class DropboxScaffoldBuilder
  def self.regenerate(endpoint)
    builder = new
    builder.clobber endpoint
    builder.generate endpoint
  end

  PREFIX = "/dropbox_api_fixtures"

  def clobber(endpoint_name)
    client.delete(endpoint_prefix endpoint_name)
  rescue DropboxApi::Errors::NotFoundError
    false
  end

  def generate(endpoint_name)
    send endpoint_name
  end

  def client
    @client ||= DropboxApi::Client.new
  end

  def get_metadata
    prefix = endpoint_prefix :get_metadata

    client.upload("#{prefix}/file.txt", "This is a test file.", {
      :client_modified => Time.new(1988, 12, 8, 1, 1, 0, "+00:00")
    })
    client.create_folder("#{prefix}/folder")
    client.upload("#{prefix}/deleted_file.txt", "This is a test file.")
    client.delete("#{prefix}/deleted_file.txt")
  end

  private

  # We have a prefix for each endpoint to avoid conflicts across them
  def endpoint_prefix(endpoint_name)
    File.join PREFIX, endpoint_name.to_s
  end
end
