context DropboxApiV2::Endpoints::Sharing do
  before :each do
    @client = DropboxApiV2::Client.new
  end

  describe "#share_folder" do
    it "returns the shared folder", :cassette => "shared_folder/success" do
      folder = @client.share_folder("/folder_b")

      expect(folder).to be_a(DropboxApiV2::Metadata::SharedFolder)
    end

    it "returns the shared folder", :cassette => "shared_folder/bad_path" do
      expect {
        @client.share_folder("/folder_b")
      }.to raise_error(DropboxApiV2::Errors::BadPathError)
    end
  end
end
