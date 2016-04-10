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
end
