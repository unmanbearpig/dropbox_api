context DropboxApi::Endpoints::Users do
  before :each do
    @client = DropboxApi::Client.new
  end

  describe "#get_account" do
    it "returns the account information", :cassette => "get_account/success" do
      account = @client.get_account "dbid:AAAKVPLEKkkccsZMFkkZNXFeyXrPPhrtFxs"

      expect(account).to be_a(DropboxApi::Metadata::BasicAccount)
    end

    it "returns the shared folder, even if already shared", :cassette => "get_account/no_account" do
      expect {
        @client.get_account "dbid:AAAKVPLEKkkccsZMFkkZNXFeyXrPPhrtXXX"
      }.to raise_error(DropboxApi::Errors::NoAccountError)
    end
  end
end
