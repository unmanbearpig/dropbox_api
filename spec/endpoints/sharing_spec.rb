context DropboxApi::Endpoints::Sharing do
  before :each do
    @client = DropboxApi::Client.new
  end

  describe "#add_file_member" do
    it "adds members to a file", :cassette => "add_file_member/success" do
      file = "/bsd.pdf"
      result = @client.add_file_member(file, [
        DropboxApi::Metadata::Member.build_from_email_or_dropbox_id("somebody@test.com")
      ])

      expect(result)
        .to be_a(DropboxApi::Results::AddFileMemberResultList)
      expect(result.first)
        .to be_a(DropboxApi::Metadata::AddFileMemberResult)
    end
  end

  describe "#add_folder_member" do
    it "shares the folder", :cassette => "add_folder_member/success" do
      folder_id = "1236358158"
      folder = @client.add_folder_member(folder_id, [
        DropboxApi::Metadata::AddMember.build_from_string("somebody@test.com")
      ])

      # The endpoint doesn't have any return values, can't test the output!
    end

    it "shares the folder, if the param is an AddMember object", :cassette => "add_folder_member/success" do
      folder_id = 1236358158
      folder = @client.add_folder_member(folder_id, [
        DropboxApi::Metadata::AddMember.build_from_string("somebody@test.com")
      ])

      # The endpoint doesn't have any return values, can't test the output!
    end

    it "shares the folder, if the member param is an email string", :cassette => "add_folder_member/success" do
      folder_id = 1236358158
      folder = @client.add_folder_member(folder_id, ["somebody@test.com"])

      # The endpoint doesn't have any return values, can't test the output!
    end

    it "fails with an invalid folder id", :cassette => "add_folder_member/invalid_folder" do
      folder_id = "xxx"
      expect {
        folder = @client.add_folder_member(folder_id, [
          DropboxApi::Metadata::AddMember.build_from_string("somebody@test.com")
        ])
      }.to raise_error(DropboxApi::Errors::InvalidIdError)
    end
  end

  describe "#create_shared_link_with_settings" do
    context "on a file" do
      it "creates a shared link", :cassette => "create_shared_link_with_settings/success_file" do
        link = @client.create_shared_link_with_settings "/file_for_sharing.docx"

        expect(link).to be_a(DropboxApi::Metadata::FileLink)
      end

      it "raises an error if already shared", :cassette => "create_shared_link_with_settings/already_shared" do
        expect {
          @client.create_shared_link_with_settings "/file_for_sharing.docx"
        }.to raise_error(DropboxApi::Errors::SharedLinkAlreadyExistsError)
      end
    end

    context "on a folder" do
      it "creates a shared link", :cassette => "create_shared_link_with_settings/success_folder" do
        link = @client.create_shared_link_with_settings "/folder_for_sharing"

        expect(link).to be_a(DropboxApi::Metadata::FolderLink)
      end
    end
  end

  describe "#list_folder_members" do
    it "lists folder members", :cassette => "list_folder_members/success" do
      result = @client.list_folder_members "1231273663"

      expect(result).to be_a(DropboxApi::Results::SharedFolderMembers)
    end

    it "lists folder members including member actions", :cassette => "list_folder_members/success_with_actions" do
      result = @client.list_folder_members "1231273663", [:remove, :make_owner]

      expect(result).to be_a(DropboxApi::Results::SharedFolderMembers)
    end
  end

  describe "#list_shared_links" do
    context "on a file" do
      it "returns a file link", :cassette => "list_shared_links/success_file" do
        result = @client.list_shared_links :path => "/some_folder/file.txt"

        expect(result.links.last).to be_a(DropboxApi::Metadata::FileLink)
      end

      it "lists all shared links", :cassette => "list_shared_links/success_file" do
        links = @client.list_shared_links(:path => "/some_folder/file.txt").links

        expect(links.map &:url).to match_array(%w(
          https://www.dropbox.com/sh/5b0bmldpa1qi772/AAAwKkKiTdb1A78bzHCKQLeHa?dl=0
          https://www.dropbox.com/s/sp5cuhaxfn8126z/file.txt?dl=0
        ))
      end

      it "gets the direct shared link", :cassette => "list_shared_links/success_file_direct_only" do
        links = @client.list_shared_links({
          :path => "/some_folder/file.txt",
          :direct_only => true
        }).links

        expect(links.map &:url).to match_array(%w(
          https://www.dropbox.com/s/sp5cuhaxfn8126z/file.txt?dl=0
        ))
      end
    end

    context "on a folder" do
      it "returns a folder link", :cassette => "list_shared_links/success_folder" do
        result = @client.list_shared_links :path => "/some_folder/another_folder"

        expect(result.links.last).to be_a(DropboxApi::Metadata::FolderLink)
      end

      it "lists all shared links", :cassette => "list_shared_links/success_folder" do
        links = @client.list_shared_links(:path => "/some_folder/another_folder").links

        expect(links.map &:url).to match_array(%w(
          https://www.dropbox.com/sh/5b0bmldpa1qi772/AAAwKkKiTdb1A78bzHCKQLeHa?dl=0
          https://www.dropbox.com/sh/h3slcnfcs3w7sdk/AADlUYcssd70EWHX3n9CJCWwa?dl=0
        ))
      end
    end
  end

  describe "#share_folder" do
    it "returns the shared folder", :cassette => "share_folder/success" do
      folder = @client.share_folder("/folder_k")

      expect(folder).to be_a(DropboxApi::Metadata::SharedFolder)
    end

    it "returns the shared folder, even if already shared", :cassette => "share_folder/bad_path" do
      folder = @client.share_folder("/already_shared")

      expect(folder).to be_a(DropboxApi::Metadata::SharedFolder)
    end

    it "contains a shared folder id", :cassette => "share_folder/success" do
      folder = @client.share_folder("/folder_k")

      expect(folder.shared_folder_id.to_s)
        .to eq("1236414195") # taken from fixture (share_folder/success.yml)
    end
  end
end
