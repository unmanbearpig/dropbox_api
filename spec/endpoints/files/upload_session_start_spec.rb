describe DropboxApi::Client, "#upload_session_start" do
  before :each do
    @client = DropboxApi::Client.new
  end

  it "returns a session", :cassette => "upload_session_start/success" do
    session = @client.upload_session_start("Hello Dropbox!")

    expect(session).to be_a(DropboxApi::Results::UploadSessionStart)
    expect(session.session_id).to eq("AAAAAAAMOCK_SESSION_ID")
  end
end
