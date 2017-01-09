describe DropboxApi::Metadata::UploadSessionCursor do
  it "can be initialized from a Hash" do
    cursor_hash = {
      "session_id" => "2c824061bdd",
      "offset" => 1136802
    }

    cursor = described_class.new cursor_hash
    expect(cursor.session_id).to eq("2c824061bdd")
    expect(cursor.offset).to eq(1136802)
  end
end
