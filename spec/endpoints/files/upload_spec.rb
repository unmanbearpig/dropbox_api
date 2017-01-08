describe DropboxApi::Client, "#upload" do
  before :each do
    @client = DropboxApi::Client.new
  end

  it "uploads a file", :cassette => "upload/success" do
    file = @client.upload("/file.txt", "Hello Dropbox!")

    expect(file).to be_a(DropboxApi::Metadata::File)
    expect(file.name).to eq("file.txt")
  end

  it "uploads a file with `add` write mode", :cassette => "upload/success_add" do
    file = @client.upload("/file.txt", "Hola Dropbox!", {
      :autorename => true,
      :mode => :add
    })

    expect(file).to be_a(DropboxApi::Metadata::File)
    expect(file.name).to eq("file (1).txt")
  end

  it "uploads a file with `overwrite` write mode", :cassette => "upload/success_overwrite" do
    file = @client.upload("/file.txt", "Hola Dropbox!", {
      :autorename => true,
      :mode => :overwrite
    })

    expect(file).to be_a(DropboxApi::Metadata::File)
    expect(file.name).to eq("file.txt")
  end

  it "uploads a file with `overwrite` write mode", :cassette => "upload/success_update" do
    file = @client.upload("/file.txt", "Hallo Dropbox!", {
      :autorename => true,
      :mode => DropboxApi::Metadata::WriteMode.new(:update, "2a6124061bdd")
    })

    expect(file).to be_a(DropboxApi::Metadata::File)
    expect(file.name).to eq("file.txt")
  end

  it "uploads a file with `overwrite` write mode", :cassette => "upload/success_client_modified" do
    modified_at = Time.utc 2016, 12, 25, 12, 0

    file = @client.upload("/another_file.txt", "Our country is a mess!", {
      :client_modified => modified_at
    })

    expect(file).to be_a(DropboxApi::Metadata::File)
    expect(file.name).to eq("another_file.txt")
    expect(file.client_modified).to eq(modified_at)
  end

  context "when too many write operations" do
    it "raises a DropboxApi::Errors::TooManyWriteOperations exception", :cassette => "upload/too_many_write_operations" do
      expect {
        @client.upload("/file.txt", "Hello Dropbox!")
      }.to raise_error(DropboxApi::Errors::TooManyWriteOperationsError)
    end

    it "raises an exception with info to retry", :cassette => "upload/too_many_write_operations" do
      expect {
        @client.upload("/file.txt", "Hello Dropbox!")
      }.to raise_error { |error|
        expect(error.retry_after).to eq(1)
      }
    end
  end
end
