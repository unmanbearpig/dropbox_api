describe DropboxApi::Client, "#upload_session_append_v2" do
  before :each do
    @client = DropboxApi::Client.new
  end

  it "can use the cursor returned by #upload_session_start", :cassette => "upload_session_append_v2/success" do
    chunks = ["123456789", "Hello Dropbox!"]

    cursor = @client.upload_session_start(chunks.first)

    @client.upload_session_append_v2(cursor, chunks.last)

    # The endpoint doesn't have any return values, can't test the output!
  end

  it "will raise error if the cursor can't be found", :cassette => "upload_session_append_v2/not_found" do
    cursor = DropboxApi::Metadata::UploadSessionCursor.new({
      "session_id" => "INVALID_CURSOR",
      "offset" => 0
    })

    expect {
      @client.upload_session_append_v2(cursor, "Hello Dropbox!")
    }.to raise_error(DropboxApi::Errors::NotFoundError)
  end

  it "will raise error if the offset is wrong", :cassette => "upload_session_append_v2/offset_error" do
    chunk = "123456789"
    allow(chunk).to receive(:size) { 42 }

    cursor = @client.upload_session_start(chunk)

    expect {
      @client.upload_session_append_v2(cursor, "Hello Dropbox!")
    }.to raise_error(DropboxApi::Errors::UploadSessionOffsetError)
  end
end
