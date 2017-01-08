describe DropboxApi::Client, "#delete" do
  before :each do
    @client = DropboxApi::Client.new
  end

  it "returns the deleted resource", :cassette => "delete/success_folder" do
    folder = @client.delete("/arizona_baby")

    expect(folder).to be_a(DropboxApi::Metadata::Folder)
    expect(folder.name).to eq("arizona_baby")
  end

  it "returns the deleted resource", :cassette => "delete/success_file" do
    file = @client.delete("/b.jpg")

    expect(file).to be_a(DropboxApi::Metadata::File)
    expect(file.name).to eq("b.jpg")
  end

  it "raises an error if the name is invalid", :cassette => "delete/not_found" do
    expect {
      @client.delete("/unexisting folder")
    }.to raise_error(DropboxApi::Errors::NotFoundError)
  end
end
