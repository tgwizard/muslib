# MusicLibrary

This site is built in Ruby, on Rails, using MongoDB via Mongoid, presented with
Bootstrap, authenticated via Mozilla Persona.


## Development installation

Clone the repository: `git clone git@github.com:tgwizard/musiclibrary.git`. cd
into the directory.

Install Ruby, at least v1.9.3. It is recommended to use rbenv or rvm to do
this. There is a .rvmrc file, specifying the Ruby version and a separate
Gemset.

Install bundler: `gem install bundler --pre`. The --pre command is so that we
get the ability to specify Ruby version in our gemfile.

Install all gems: `bundle install`.

Install and configure MongoDB. See [installation
instructions](http://www.mongodb.org/display/DOCS/Quickstart).

Done! Start the server by running `rails s`.


## Helpful Commands

You can reset the development database by connecting to it and dropping it:

~~~
mongo music_library_development
db.dropDatabase();
~~~


## Contribute

Fork. Code. Tests. Feature branches are good. Pull request.


## License

Open source. Creative Commons. Stuff.

Copyright on works?

