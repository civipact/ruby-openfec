# OpenFecApi

[![Gem Version](https://badge.fury.io/rb/open_fec_api.svg)](http://badge.fury.io/rb/open_fec_api)

A ruby wrapper for Open Federal Elections Commission API.

Makes requests to the "candidates" endpoint.

## About OpenFEC API

https://api.open.fec.gov/

OpenFEC API allows you to explore the way candidates and committees fund their campaigns.

The API is a RESTful web service supporting full-text and field-specific searches on FEC data.This API allows you to explore the vast array of campaign finance data that the FEC collects. Each endpoint focuses on a different aspect of disclosure. Information is tied to the underlying forms by file ID and image ID.

Base URI:		  https://api.open.fec.gov/v2/
HTTP Method:	  GET
Response format: .json

## Installation

Add `gem 'open_fec_api'` to your application's *Gemfile* and run `bundle install`, or install manually with `gem install open_fec_api`.

## Configuration

OpenFecApi::Client.api_key = 'yourapikeyfromtheurlabove'

OLD: Configure a client with your [API key](https://api.data.gov/signup/) before making requests.

```` rb
client = OpenFecApi::Client.new("api_key_123")
````

## Usage

Make a request.

```` rb
response = client.candidates
````

Request different pages by setting the `:page` request parameter. Avoid rate-limits by increasing the `:per_page` request parameter to 100.

```` rb
options = {:page => 1, :per_page => 100}
response = client.candidates(options)
while response.page < response.pages do
  options.merge!({:page => response.page + 1})
  response = client.candidates(options)
end
````

Make requests using endpoint-specific parameters.

```` rb
options = {:party => "DEM"}
response = client.candidates(options)
````

Make requests on Committee endpoint

```` rb
response = client.committees(options)
````

## Contributing

Help wrap all the [endpoints](ENDPOINTS.md)!

Browse existing issues or create a new issue to communicate bugs, desired features, etc.

After forking the repo and pushing your changes, create a pull request referencing the applicable issue(s).

### Installation

Check out the repo with `git clone git@github.com:debate-watch/open-fec-api-ruby.git`, and `cd open-fec-api-ruby`.

After checking out the repo, run `bin/setup` to install dependencies.

### Testing

Run `bundle exec rake` or `bundle exec rspec spec/` to run the tests.

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

### Releasing

Update the version number in `version.rb`, then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).
