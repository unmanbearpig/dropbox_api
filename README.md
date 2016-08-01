# DropboxApiV2

Ruby gem to interact with Dropbox API v2.

**IMPORTANT: This is work in progress, no gem has been released yet. I would like
to publish version 0.1 shortly, when that happens you'll be able to use this
library by just following the instructions below.**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dropbox_api_v2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dropbox_api_v2

## Usage

### Authorize your application

Dropbox uses OAuth, in order to use this library from your application you'll
have to get an authorization code.

Once you have it, just pass it on client initialization:

    DropboxApiV2::Client.new("VofXAX8D...")
    #=> #<DropboxApiV2::Client ...>

Or set it as an ENV variable called `DROPBOX_OAUTH_BEARER`, for example:

    ENV["DROPBOX_OAUTH_BEARER"] = "VofXAX8D..."
    DropboxApiV2::Client.new
    #=> #<DropboxApiV2::Client ...>

#### Option A: Get your access token from the website

The easiest way to obtain an access token is to get it from the Dropbox website.
You just need to log in to Dropbox and refer to the *developers* section, go to
*My apps* and select your application, you may need to create one if you
haven't done so yet.

Under your application settings, find section *OAuth 2*. You'll find a button
to generate an access token.

#### Option B: Use `DropboxApiV2::Authenticator`

You can obtain an authorization code with this library:

1. `require "dropbox_api_v2/authenticator"`
1. `authenticator = DropboxApiV2::Authenticator.new(CLIENT_ID, CLIENT_SECRET)`
2. `authenticator.authorize_url  #=> "https://www.dropbox.com/..."`
3. Open the authorization URL in your browser, authorize the application and
   copy your code.
4. `auth_bearer = authenticator.get_token(CODE) #=> #<OAuth2::AccessToken ...>`
5. `auth_bearer.token #=> "VofXAX8D..."`. Keep this token!

#### Standard OAuth flow

Not implemented yet. :(

### Performing API calls

Once you've initialized a client, for example:

    client = DropboxApiV2::Client.new("VofXAX8D...")
    #=> #<DropboxApiV2::Client ...>

You can perform an API call like this:

    result = client.list_folder "/sample_folder"
    #=> #<DropboxApiV2::Results::ListFolderResult>
    result.entries
    #=> [#<DropboxApiV2::Metadata::Folder>, #<DropboxApiV2::Metadata::File>]
    result.has_more?
    #=> false

Refer to the documentation to see the details for each endpoint.

## Dependencies

###Network adapter

This gem uses [faraday](https://github.com/lostisland/faraday#faraday).
So it should work on any network library.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release` to create a git tag for the version, push git
commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Any help will be much appreciated. It should be quite easy to implement most
of the [endpoints that are still pending](api_coverage.md).

1. Fork it ( https://github.com/Jesus/dropbox_api_v2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
