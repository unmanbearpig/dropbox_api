context DropboxApi::Metadata::File do
  let(:content_hash) { nil }
  let(:media_info) { nil }
  let(:file_hash) do
    {
      ".tag" => "file",
      "name" => "visrez-video.mp4",
      "path_lower" => "/visrez-video.mp4",
      "path_display" => "/visrez-video.mp4",
      "id" => "id:ARSNw7QJjrAAAAAAAAAAAQ",
      "client_modified" => "2016-05-22T09:31:26Z",
      "server_modified" => "2016-05-22T09:31:26Z",
      "rev" => "2c824061bdd",
      "size" => 1136802,
      "content_hash" => content_hash,
      "media_info" => media_info
    }
  end

  subject { DropboxApi::Metadata::File.new(file_hash) }

  describe '.new' do
    context 'can be initialized from a hash' do
      it 'works' do
        expect(subject).to be_a(DropboxApi::Metadata::File)
        expect(subject.name).to eq("visrez-video.mp4")
        expect(subject.path_lower).to eq("/visrez-video.mp4")
        expect(subject.path_display).to eq("/visrez-video.mp4")
        expect(subject.id).to eq("id:ARSNw7QJjrAAAAAAAAAAAQ")
        expect(subject.client_modified).to eq(Time.utc(2016, 5, 22, 9, 31, 26))
        expect(subject.server_modified).to eq(Time.utc(2016, 5, 22, 9, 31, 26))
        expect(subject.rev).to eq("2c824061bdd")
        expect(subject.size).to eq(1136802)
      end
    end

    context 'includes the content_hash field' do
      let(:content_hash) { '2a846fa617c3361fc117e1c5c1e1838c336b6a5cef982c1a2d9bdf68f2f1992a' }

      it 'works' do
        expect(subject).to be_a(DropboxApi::Metadata::File)
        expect(subject.content_hash).to eq('2a846fa617c3361fc117e1c5c1e1838c336b6a5cef982c1a2d9bdf68f2f1992a')
      end
    end

    context "includes the media_info field" do
      let(:media_info) do
        {".tag"=>"photo", "dimensions"=>{"height"=>1500, "width"=>1500}, "time_taken"=>"2016-09-04T17:00:27Z"}
      end

      it 'works' do
        expect(subject).to be_a(DropboxApi::Metadata::File)
        expect(subject.media_info).to eq({".tag"=>"photo", "dimensions"=>{"height"=>1500, "width"=>1500}, "time_taken"=>"2016-09-04T17:00:27Z"})
      end
    end
  end

  it "can be converted back to a hash" do
    expect(subject.to_hash).to eq(file_hash.delete_if { |k, v| v.nil? })
  end
end
