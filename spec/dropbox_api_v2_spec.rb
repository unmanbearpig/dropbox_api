require 'spec_helper'

describe DropboxApiV2 do
  it 'has a version number' do
    expect(DropboxApiV2::VERSION).not_to be nil
  end

  it 'checks VCR' do
    VCR.use_cassette("vcr_check") do
      client = DropboxApiV2::Client.new
      r = client.list_folder ""

      expect(r).to be_a(Hash)
    end
  end


end
