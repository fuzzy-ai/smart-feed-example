# README

Example Rails application for a "tweet relevance" agent using https://fuzzy.ai/

## Local installation

### Requirements

* Ruby >= 2.2.2 (Use [rvm](http://rvm.io/) to get recent ruby versions)
* Bundler (`gem install bundler`)
* Postgresql

### Steps

1. Clone the repository
1. Run `bundle install`
1. Run `bundle exec rails db:create`
1. Create a .env based on env.sample (`cp env.sample .env`)
1. Run `bundle exec rails server`
1. Load the site at http://localhost:3000/
