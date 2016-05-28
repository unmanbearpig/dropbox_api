context DropboxApiV2::Endpoints::Files do
  before :each do
    @client = DropboxApiV2::Client.new
  end

  describe "#copy" do
    it "returns the moved file on success", :cassette => "copy/success" do
      file = @client.copy("/a.jpg", "/b.jpg")

      expect(file).to be_a(DropboxApiV2::Metadata::File)
      expect(file.name).to eq("b.jpg")
    end

    it "raises an error if the file can't be found", :cassette => "copy/not_found" do
      expect {
        @client.copy("/z.jpg", "/b.jpg")
      }.to raise_error(DropboxApiV2::Errors::NotFoundError)
    end

    it "raises an error if the path is invalid", :cassette => "copy/malformed_path" do
      expect {
        @client.copy("/../invalid_path.jpg", "/b.jpg")
      }.to raise_error(DropboxApiV2::Errors::MalformedPathError)
    end
  end

  describe "#create_folder" do
    it "returns the new folder on success", :cassette => "create_folder/success" do
      folder = @client.create_folder("/arizona_baby")

      expect(folder).to be_a(DropboxApiV2::Metadata::Folder)
      expect(folder.name).to eq("arizona_baby")
    end

    it "raises an error if the name is invalid", :cassette => "create_folder/malformed_path" do
      expect {
        @client.create_folder("/arizona\\baby")
      }.to raise_error(DropboxApiV2::Errors::MalformedPathError)
    end

    it "raises an error if the resource causes a conflict", :cassette => "create_folder/conflict" do
      expect {
        @client.create_folder("/b.jpg")
      }.to raise_error(DropboxApiV2::Errors::FileConflictError)
    end
  end

  describe "#delete" do
    it "returns the deleted resource", :cassette => "delete/success_folder" do
      folder = @client.delete("/arizona_baby")

      expect(folder).to be_a(DropboxApiV2::Metadata::Folder)
      expect(folder.name).to eq("arizona_baby")
    end

    it "returns the deleted resource", :cassette => "delete/success_file" do
      file = @client.delete("/b.jpg")

      expect(file).to be_a(DropboxApiV2::Metadata::File)
      expect(file.name).to eq("b.jpg")
    end

    it "raises an error if the name is invalid", :cassette => "delete/not_found" do
      expect {
        @client.delete("/unexisting folder")
      }.to raise_error(DropboxApiV2::Errors::NotFoundError)
    end
  end

  describe "#download" do
    it "returns the file", :cassette => "download/success" do
      file = @client.download("/file.txt")

      expect(file).to be_a(DropboxApiV2::Metadata::File)
      expect(file.name).to eq("file.txt")
    end

    it "raises an error if the name is invalid", :cassette => "download/not_found" do
      expect {
        @client.download("/c.jpg")
      }.to raise_error(DropboxApiV2::Errors::NotFoundError)
    end
  end

  describe "#get_metadata" do
    it "may return a `File`", :cassette => "get_metadata/success_file" do
      file = @client.get_metadata("/file.txt")

      expect(file).to be_a(DropboxApiV2::Metadata::File)
      expect(file.name).to eq("file.txt")
    end

    it "may return a `Folder`", :cassette => "get_metadata/success_folder" do
      folder = @client.get_metadata("/folder")

      expect(folder).to be_a(DropboxApiV2::Metadata::Folder)
      expect(folder.name).to eq("folder")
    end

    it "raises an error if the path is wrong", :cassette => "get_metadata/not_found" do
      expect {
        @client.get_metadata("/unexisting_folder")
      }.to raise_error(DropboxApiV2::Errors::NotFoundError)
    end

    it "raises an error if an invalid option is given" do
      expect {
        @client.get_metadata("/file.txt", :invalid_option => true)
      }.to raise_error ArgumentError
    end

    context "on a deleted file" do
      it "raises an error", :cassette => "get_metadata/deleted" do
        expect {
          @client.get_metadata("/file.txt")
        }.to raise_error(DropboxApiV2::Errors::NotFoundError)
      end

      it "with `:include_deleted`, returns a `File`", :cassette => "get_metadata/success_deleted" do
        file = @client.get_metadata("/file.txt", :include_deleted => true)

        expect(file).to be_a(DropboxApiV2::Metadata::Deleted)
        expect(file.name).to eq("file.txt")
      end
    end
  end

  describe "#get_preview" do
    it "returns the file", :cassette => "get_preview/success" do
      file = @client.get_preview("/file.docx")

      expect(file).to be_a(DropboxApiV2::Metadata::File)
      expect(file.name).to eq("file.docx")
    end

    it "raises an error if the name is invalid", :cassette => "get_preview/not_found" do
      expect {
        @client.get_preview("/unknown_file.jpg")
      }.to raise_error(DropboxApiV2::Errors::NotFoundError)
    end
  end

  describe "#get_temporary_link", :cassette => "get_temporary_link/success" do
    it "returns a GetTemporaryLinkResult with file and link" do
      result = @client.get_temporary_link "/img.png"

      expect(result).to be_a(DropboxApiV2::Results::GetTemporaryLinkResult)
      expect(result.file.name).to eq("img.png")
    end

    it "raises an error if the file can't be found", :cassette => "get_temporary_link/not_found" do
      expect {
        @client.get_preview "/unknown_file.jpg"
      }.to raise_error(DropboxApiV2::Errors::NotFoundError)
    end
  end

  describe "#get_thumbnail", :cassette => "get_thumbnail/success" do
    it "returns a file" do
      file = @client.get_thumbnail "/img.png"

      expect(file).to be_a(DropboxApiV2::Metadata::File)
      expect(file.name).to eq("img.png")
    end

    it "raises an error if the file can't be found", :cassette => "get_thumbnail/not_found" do
      expect {
        @client.get_thumbnail "/unknown_file.jpg"
      }.to raise_error(DropboxApiV2::Errors::NotFoundError)
    end

    it "raises an argument error with invalid options" do
      expect {
        @client.get_thumbnail "/img.png", :invalid_arg => "value"
      }.to raise_error(ArgumentError)
    end
  end
end
