require 'json'
require 'faraday'

require "dropbox_api_v2/middleware/decode_json"
require "dropbox_api_v2/middleware/encode_json"

require "dropbox_api_v2/metadata/base"
require "dropbox_api_v2/metadata/file"
require "dropbox_api_v2/metadata/factory"

require "dropbox_api_v2/errors/basic_error"
require "dropbox_api_v2/errors/lookup_error"
require "dropbox_api_v2/errors/relocation_error"
require "dropbox_api_v2/errors/write_conflict_error"
require "dropbox_api_v2/errors/write_error"

require "dropbox_api_v2/client"
require "dropbox_api_v2/response"

require 'dropbox_api_v2/endpoints/base'
require 'dropbox_api_v2/endpoints/files/copy'

require "dropbox_api_v2/version"
