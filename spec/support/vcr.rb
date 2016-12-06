require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
  config.default_cassette_options = {
    :match_requests_on => [:method, :uri, :body_as_json]
  }
end

RSpec.configure do |c|
  c.around(:each) do |example|
    if example.metadata[:cassette].nil?
      example.run
    else
      VCR.use_cassette(example.metadata[:cassette]) { example.run }
    end
  end
end
