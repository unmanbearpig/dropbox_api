describe DropboxApi::Client, "#list_folder" do
  before :each do
    @client = DropboxApi::Client.new
  end

  it "returns a ListFolderResult", :cassette => "list_folder/success" do
    result = @client.list_folder ""

    expect(result).to be_a(DropboxApi::Results::ListFolderResult)
  end

  it "raises an error if the file can't be found", :cassette => "list_folder/not_found" do
    expect {
      @client.list_folder "/unexisting_folder"
    }.to raise_error(DropboxApi::Errors::NotFoundError)
  end

  it "returns all entries as metadata objects", :cassette => "list_folder/success" do
    result = @client.list_folder ""

    result.entries.each do |resource|
      expect(resource).to be_a(DropboxApi::Metadata::Base)
    end
  end

  it "raises an argument error with invalid options" do
    expect {
      @client.list_folder "/img.png", :invalid_arg => "value"
    }.to raise_error(ArgumentError)
  end
end
