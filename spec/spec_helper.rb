$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'dropbox_api_v2'
require 'support/vcr'

ENV["DROPBOX_OAUTH_BEARER"] ||= "NOTHING, JUST MOCKS"
