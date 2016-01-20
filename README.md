# Memoir
Ruby client library for easy communication with OpenTSDB v2.2+

[![Build Status](https://secure.travis-ci.org/Misenko/memoir.png)](http://travis-ci.org/Misenko/memoir)
[![Dependency Status](https://gemnasium.com/Misenko/memoir.png)](https://gemnasium.com/Misenko/memoir)
[![Gem Version](https://fury-badge.herokuapp.com/rb/memoir.png)](https://badge.fury.io/rb/memoir)
[![Code Climate](https://codeclimate.com/github/Misenko/memoir.png)](https://codeclimate.com/github/Misenko/memoir)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'memoir'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install memoir
```

## Usage example
Memoir classes and attributes loosely follow the OpenTSDB query api described here:
[http://opentsdb.net/docs/build/html/api_http/query/index.html](http://opentsdb.net/docs/build/html/api_http/query/index.html)

```ruby
# Create a 'literal_or' filter for tag 'hostname' matching any of values 'some.host1', 'some.host2' and 'some.host3' without grouping
filter = Memoir::Filter.new Memoir::FilterType::LITERAL_OR, 'hostname', 'some.host1|some.host2|some.host3', false
# Create a query for metric 'some.important.metric' with aggregator 'sum'
query = Memoir::Query.new Memoir::Aggregator::SUM, 'some.important.metric'
# Create a downsample per one day with aggregator 'avg'
downsample = Memoir::Downsample.new Memoir::TimePeriod.new(1, Memoir::Units::DAYS), Memoir::Aggregator::AVG
query.downsample = downsample
# Add filter to the query
query << filter
# Create a request for data from one month ago till now (default value for no end time)
request = Memoir::Request.new Memoir::TimePeriod.new(1, Memoir::Units::MONTHS)
# Add query to the request
request << query
# Initialize client
client = Memoir::Client.new 'http://opentsdb.host.org', 4242
# Dry running a request will print a request body in JSON format
client.dry_run request
# Run request
response = client.run request

puts response.status
puts response.data_sets.first.dps unless response.data_sets.empty?
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/Misenko/memoir.
