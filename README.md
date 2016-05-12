# ruby-openfec


A ruby wrapper for Open Federal Elections Commission API.

## About OpenFEC API

https://api.open.fec.gov/

OpenFEC API allows you to explore the way candidates and committees fund their campaigns.

The API is a RESTful web service supporting full-text and field-specific searches on FEC data.This API allows you to explore the vast array of campaign finance data that the FEC collects. Each endpoint focuses on a different aspect of disclosure. Information is tied to the underlying forms by file ID and image ID.

Base URI:		  https://api.open.fec.gov/v1/

HTTP Method:	  GET

Response format: .json


## Installation

Add `gem 'ruby-openfec'` to your application's *Gemfile* and run `bundle install`, or install manually with `gem install ruby-openfec`.

## Configuration

Configure a client with your [API key](https://api.data.gov/signup/) before making requests.  The API Key should be stored locally as an Environment variable in your Bash or Zsh Profile, called "OPEN_FEC_API_KEY"

````
export OPEN_FEC_API_KEY=yourapikeyfromtheurlabove
````



## Usage


Request a specific page by setting the `:page` parameter. Avoid reaching rate-limits by updating the `:per_page` request parameter, up to 100.

```` rb
options = {:page => 1, :per_page => 100}
lots_of_candidates = OpenFec::Candidate.all_with(options)
````

Make requests using endpoint-specific parameters.

```` rb
options = {:party => "DEM"}
democrats = OpenFec::Candidate.all_with(options)
````

Make requests on Committee endpoint

```` rb
every_committee = OpenFec::Committee.all
````

Request Committee history, by 'committee_id' parameter
```` rb
options = {:committee_id => "C00462390"}
comm_hist = OpenFec::Committee.history(options)
````


### Installation

Check out the repo with `git clone http://github.com/chriscondon/ruby-openfec, then `cd ruby-openfec`.

After checking out the repo, run `bin/setup` to install dependencies.

### Testing

Run `bundle exec rspec spec/` to run the tests.


### Classes / Methods


#### OpenFec::Candidate

```ruby
OpenFec::Candidate.all
OpenFec::Candidate.all_sort_by(field)
OpenFec::Candidate.all_where(options = {})
OpenFec::Candidate.by_name(name)
OpenFec::Candidate.history(candidate_id, options = {})
OpenFec::Candidate.committees(candidate_id, options = {})
OpenFec::Candidate.committee_history(candidate_id, options = {})
OpenFec::Candidate.communication_costs(candidate_id, options = {})
OpenFec::Candidate.electioneering_costs(candidate_id, options = {})
OpenFec::Candidate.history_by_cycle(candidate_id, cycle)
```

#### OpenFec::Committee

```ruby
OpenFec::Committee.all
OpenFec::Committee.all_sort_by(sort_field, options = {})
OpenFec::Committee.all_where(options)
OpenFec::Committee.history(options)
OpenFec::Committee.history_by_cycle(committee_id, cycle)
OpenFec::Committee.communication_costs(committee_id)
OpenFec::Committee.electioneering_costs(committee_id)
OpenFec::Committee.reports(committee_id)
OpenFec::Committee.financial_totals(committee_id)
OpenFec::Committee.schedule_a_by_contributor(committee_id)
OpenFec::Committee.schedule_a_by_employer(committee_id)
```

#### OpenFec::Schedule

```ruby
OpenFec::Schedule.a_all
OpenFec::Schedule.a_by_contributor(options)
OpenFec::Schedule.a_by_contributor_type_and_candidate(options = {})
OpenFec::Schedule.a_by_employer(options)
OpenFec::Schedule.a_by_occupation(options)
OpenFec::Schedule.a_by_size(options)
OpenFec::Schedule.a_by_size_and_candidate(options = {})
OpenFec::Schedule.a_by_state
OpenFec::Schedule.a_by_state_and_candidate(options = {})
OpenFec::Schedule.a_by_state(options)
OpenFec::Schedule.a_by_zip({options})

OpenFec::Schedule.b_all
OpenFec::Schedule.b_by_purpose({options})
OpenFec::Schedule.b_by_recipient(options = {})
OpenFec::Schedule.b_by_recipient_id(options = {})
OpenFec::Schedule.b_by_committee_and_candidate(committee_id, options = {})

OpenFec::Schedule.e_all
OpenFec::Schedule.e_by_candidate({options})
```

#### OpenFec::Financial

```ruby
OpenFec::Financial.committee_reports(committee_id)
OpenFec::Financial.committee_totals(committee_id)
OpenFec::Financial.elections({query_options})
OpenFec::Financial.reports_by_committee_type(committee_type)
```

#### OpenFec::Search

```ruby
OpenFec::Search.candidates(name)
OpenFec::Search.committees(name)
OpenFec::Search.filings(options = {})
OpenFec::Search.reporting_dates(options = {})
OpenFec::Search.elections(options = {})
```

#### OpenFec::Date

```ruby
OpenFec::Date.calendar_dates
OpenFec::Date.election_dates
OpenFec::Date.reporting_dates
```



