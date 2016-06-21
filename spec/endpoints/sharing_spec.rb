context DropboxApiV2::Endpoints::Sharing do
  before :each do
    @client = DropboxApiV2::Client.new
  end

  describe "#share_folder" do
    it "returns the shared folder", :cassette => "share_folder/success" do
      folder = @client.share_folder("/folder_k")

      expect(folder).to be_a(DropboxApiV2::Metadata::SharedFolder)
    end

    it "returns the shared folder, even if already shared", :cassette => "share_folder/bad_path" do
      folder = @client.share_folder("/already_shared")

      expect(folder).to be_a(DropboxApiV2::Metadata::SharedFolder)
    end

    it "contains a shared folder id", :cassette => "share_folder/success" do
      folder = @client.share_folder("/folder_k")

      expect(folder.shared_folder_id.to_s)
        .to eq("1236414195") # taken from fixture (share_folder/success.yml)
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

    it "shares the folder, if the member param is a string", :cassette => "add_folder_member/success" do
      folder_id = 1236358158
      folder = @client.add_folder_member(folder_id, ["somebody@test.com"])

      # The endpoint doesn't have any return values, can't test the output!
    end

    it "fails with an invalid folder id", :cassette => "add_folder_member/invalid_folder" do
      folder_id = "xxx"
      expect {
        folder = @client.add_folder_member(folder_id, [
          DropboxApiV2::Metadata::AddMember.new("somebody@test.com")
        ])
      }.to raise_error(DropboxApiV2::Errors::InvalidIdError)
    end
  end

  describe "#list_folder_members" do
    it "lists folder members", :cassette => "list_folder_members/success"
  end
end
