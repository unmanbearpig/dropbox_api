context DropboxApiV2::Endpoints::Users do
  before :each do
    @client = DropboxApiV2::Client.new
  end

  describe "#get_account" do
    it "returns the account information", :cassette => "get_account/success" do
      account = @client.get_account "dbid:AAAKVPLEKkkccsZMFkkZNXFeyXrPPhrtFxs"

      expect(account).to be_a(DropboxApiV2::Metadata::BasicAccount)
    end

    it "returns the shared folder, even if already shared", :cassette => "get_account/no_account" do
      expect {
        @client.get_account "dbid:AAAKVPLEKkkccsZMFkkZNXFeyXrPPhrtXXX"
      }.to raise_error(DropboxApiV2::Errors::NoAccountError)
    end
  end
end
