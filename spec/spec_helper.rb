require 'dropbox_api'
require 'support/vcr'

ENV["DROPBOX_OAUTH_BEARER"] ||= "MOCK_AUTHORIZATION_BEARER"
