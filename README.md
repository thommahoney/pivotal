# Pivotal

Pivotal Tracker API Client

## Installation

Add this line to your application's Gemfile:

    gem 'pivotal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pivotal

## Releasing

    gem bump -trv patch

## Usage

Token is either in ~/.pivotal or passed in as {token: "token"} to Pivotal::Client#new

```
client = Pivotal::Client.new(token: "token")
# => #<Pivotal::Client::Real:0x007f8313a1f598
project = client.projects.get(635517)
#  => <Pivotal::Client::Project
current_iteration = project.iterations.current
# =>  <Pivotal::Client::Iteration
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
