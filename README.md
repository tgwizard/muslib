# muslib.org

This is very much a work in progress, to a large extent just for the fun of it.

This site is built in [Ruby](http://www.ruby-lang.org), on
[Rails](http://rubyonrails.org/), using [MongoDB](http://www.mongodb.org/) via
[Mongoid](http://mongoid.org), presented with
[Bootstrap](http://twitter.github.com/bootstrap/), authenticated via [Mozilla
Persona](https://login.persona.org/).

[![Build Status](https://travis-ci.org/tgwizard/muslib.png)](https://travis-ci.org/tgwizard/muslib)


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

Run all tests: `rake test`.

Done! Start the server by running `rails s`.


## Helpful Commands

You can drop the development database by running `rake db:drop`. You can seed
it by running `rake db:seed`.

[Spork](https://github.com/sporkrb/spork) is available to speed up test
running. Run `spork` in a terminal, and then use the test scripts to run your
tests:

~~~
./tall.sh # runs all tests through spork
./t.sh test/unit/composer.rb # runs just the specified test
~~~


## Contribute

Fork. Code. Tests. Feature branches are good. Pull request.


## License

Open source. Creative Commons. Stuff.

Copyright on works?

