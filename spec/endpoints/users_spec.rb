context DropboxApi::Endpoints::Users do
  before :each do
    @client = DropboxApi::Client.new
  end

  describe "#get_account" do
    it "returns the account information", :cassette => "get_account/success" do
      account = @client.get_account "dbid:AAAKVPLEKkkccsZMFkkZNXFeyXrPPhrtFxs"

      expect(account).to be_a(DropboxApi::Metadata::BasicAccount)
    end

    it "raises an error if the account can't be found", :cassette => "get_account/no_account" do
      expect {
        @client.get_account "dbid:AAAKVPLEKkkccsZMFkkZNXFeyXrPPhrtXXX"
      }.to raise_error(DropboxApi::Errors::NoAccountError)
    end
  end

  describe "#get_current_account" do
    it "returns the current account information", :cassette => "get_current_account/success" do
      account = @client.get_current_account

      expect(account).to be_a(DropboxApi::Metadata::BasicAccount)
    end
  end

  describe "#get_space_usage" do
    it "returns the account usage information", :cassette => "get_space_usage/success" do
      space_usage = @client.get_space_usage

      expect(space_usage).to be_a(DropboxApi::Metadata::SpaceUsage)
    end
  end
end
