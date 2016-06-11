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

    it "contains a shared folder id", :cassette => "shared_folder/success" do
      folder = @client.share_folder("/folder_b")

      expect(folder.shared_folder_id.to_s)
        .to eq("1236358158") # taken from fixture (shared_folder/success.yml)
    end
  end

  describe "#add_folder_member" do
    it "shares the folder", :cassette => "add_folder_member/success" do
      folder_id = "1236358158"
      folder = @client.add_folder_member(folder_id, [
        DropboxApiV2::Metadata::AddMember.new("somebody@test.com")
      ])

      # The endpoint doesn't have any return values, can't test the output!
    end

    it "shares the folder, if the param is an integer", :cassette => "add_folder_member/success" do
      folder_id = 1236358158
      folder = @client.add_folder_member(folder_id, [
        DropboxApiV2::Metadata::AddMember.new("somebody@test.com")
      ])

      # The endpoint doesn't have any return values, can't test the output!
    end

    it "fails with an invalid folder id", :cassette => "shared_folder/invalid_folder" do
      folder_id = "xxx"
      expect {
        folder = @client.add_folder_member(folder_id, [
          DropboxApiV2::Metadata::AddMember.new("somebody@test.com")
        ])
      }.to raise_error(DropboxApiV2::Errors::InvalidIdError)
    end
  end
end
