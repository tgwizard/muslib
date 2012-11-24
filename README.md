# muslib.org

This site is built in Ruby, on Rails, using MongoDB via Mongoid, presented with
Bootstrap, authenticated via Mozilla Persona.

[![Build Status](https://travis-ci.org/[tgwizard]/[muslib].png)](https://travis-ci.org/[tgwizard]/[muslib])


## Development installation

Clone the repository: `git clone git@github.com:tgwizard/muslib.git`. cd
into the directory.

Install Ruby, at least v1.9.3. It is recommended to use rbenv or rvm to do
this. There is a .rvmrc file, specifying the Ruby version and a separate
Gemset.

Install bundler: `gem install bundler --pre`. The --pre command is so that we
get the ability to specify Ruby version in our gemfile.

Install all gems: `bundle install`.

Install and configure MongoDB. See [installation
instructions](http://www.mongodb.org/display/DOCS/Quickstart).

Run all unit tests: `rake test:units`.

Done! Start the server by running `rails s`.


## Helpful Commands

You can drop the development database by running `rake db:drop`.


## Contribute

Fork. Code. Tests. Feature branches are good. Pull request.


## License

Open source. Creative Commons. Stuff.

Copyright on works?

