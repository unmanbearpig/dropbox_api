require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb

  headers_matcher =
  config.default_cassette_options = {
    :match_requests_on => [
      :method,
      :uri,
      :body,
      lambda { |a, b|
        [
          "Authorization",
          "Dropbox-Api-Arg"
        ].all? { |header| a.headers[header] == b.headers[header] }
      }
    ]
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
