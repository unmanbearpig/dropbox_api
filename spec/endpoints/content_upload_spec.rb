describe DropboxApi::Endpoints::ContentUpload do
  shared_examples_for "is calculated and appended to headers" do
    it "is calculated and appended to headers" do
      _, headers = subject.build_request({}, body)
      expect(headers['Content-Length']).to eq(content_length)
    end
  end

  let(:builder) { DropboxApi::ConnectionBuilder.new("bearer") }
  let(:content) { "tested content" }
  let(:content_length) { content.length.to_s }
  subject { described_class.new(builder) }

  context 'Content-Length header' do
    context 'for string body' do
      let(:body) { content }

      include_examples "is calculated and appended to headers"
    end

    context 'for File body' do
      let(:body) { Tempfile.new('dropbox_api') }
      around(:each) do |example|
        body << content
        example.run
        body.close
      end

      include_examples "is calculated and appended to headers"
    end

    context 'for nil' do
      let(:body) { nil }

      it 'is not in headers' do
        _, headers = subject.build_request({}, body)
        expect(headers).to_not have_key("Content_length")
      end
    end
  end
end
