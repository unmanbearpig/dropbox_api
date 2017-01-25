require 'dropbox_api'
require File.expand_path('../../fixtures/dropbox_scaffold_builder', __FILE__)

namespace :test do
  namespace :build_scaffold do
    # TODO: Rather than adding a task for each endpoint, we should have a
    #       generic task that would take the endpoint name as a parameter.
    task :get_metadata => :show_account_warning do
      builder = DropboxScaffoldBuilder.new
      builder.clobber :get_metadata
      builder.generate :get_metadata
    end

    task :show_account_warning do
      print "NOTE: This task will make changes on a real Dropbox account..."
      sleep 5
      puts " ok, going ahead!"
    end
  end

  namespace :vcr do
    task :mock_authorization_bearer do
      cassettes_path = File.expand_path '../../fixtures/vcr_cassettes', __FILE__
      cassettes_path = File.join cassettes_path, "**/*.yml"

      Dir.glob(cassettes_path).each do |file|
        cassette = File.read file
        cassette = YAML.load cassette
        cassette["http_interactions"].each do |interaction|
          # We're not using Hash#dig to keep compatibility with old Rubies
          next unless interaction.has_key? "request"
          next unless interaction["request"].has_key? "headers"
          next unless interaction["request"]["headers"].has_key? "Authorization"

          interaction["request"]["headers"]["Authorization"] = ["Bearer MOCK_AUTHORIZATION_BEARER"]
        end
        cassette = YAML.dump cassette
        cassette = File.write file, cassette
      end
    end
  end
end
