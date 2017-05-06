context DropboxApi::Metadata::File do
  it "can be initialized from a hash" do
    file_hash = {
      ".tag" => "file",
      "name" => "visrez-video.mp4",
      "path_lower" => "/visrez-video.mp4",
      "path_display" => "/visrez-video.mp4",
      "id" => "id:ARSNw7QJjrAAAAAAAAAAAQ",
      "client_modified" => "2016-05-22T09:31:26Z",
      "server_modified" => "2016-05-22T09:31:26Z",
      "rev" => "2c824061bdd",
      "size" => 1136802
    }

    file = DropboxApi::Metadata::File.new file_hash
    expect(file).to be_a(DropboxApi::Metadata::File)
    expect(file.name).to eq("visrez-video.mp4")
    expect(file.path_lower).to eq("/visrez-video.mp4")
    expect(file.path_display).to eq("/visrez-video.mp4")
    expect(file.id).to eq("id:ARSNw7QJjrAAAAAAAAAAAQ")
    expect(file.client_modified).to eq(Time.utc(2016, 5, 22, 9, 31, 26))
    expect(file.server_modified).to eq(Time.utc(2016, 5, 22, 9, 31, 26))
    expect(file.rev).to eq("2c824061bdd")
    expect(file.size).to eq(1136802)
  end

  it "includes the content_hash field" do
    file_hash = {
      ".tag" => "file",
      "name" => "visrez-video.mp4",
      "path_lower" => "/visrez-video.mp4",
      "path_display" => "/visrez-video.mp4",
      "id" => "id:ARSNw7QJjrAAAAAAAAAAAQ",
      "client_modified" => "2016-05-22T09:31:26Z",
      "server_modified" => "2016-05-22T09:31:26Z",
      "rev" => "2c824061bdd",
      "size" => 1136802,
      "content_hash" => "2a846fa617c3361fc117e1c5c1e1838c336b6a5cef982c1a2d9bdf68f2f1992a"
    }

    file = DropboxApi::Metadata::File.new file_hash
    expect(file).to be_a(DropboxApi::Metadata::File)
    expect(file.content_hash).to eq("2a846fa617c3361fc117e1c5c1e1838c336b6a5cef982c1a2d9bdf68f2f1992a")
  end

  it "can be converted back to a hash" do
    file_hash = {
      ".tag" => "file",
      "name" => "visrez-video.mp4",
      "path_lower" => "/visrez-video.mp4",
      "path_display" => "/visrez-video.mp4",
      "id" => "id:ARSNw7QJjrAAAAAAAAAAAQ",
      "client_modified" => "2016-05-22T09:31:26Z",
      "server_modified" => "2016-05-22T09:31:26Z",
      "rev" => "2c824061bdd",
      "size" => 1136802
    }

    file = DropboxApi::Metadata::File.new file_hash

    expect(file.to_hash).to eq(file_hash)
  end
end
