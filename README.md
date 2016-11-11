# README

Example Rails application for a "tweet relevance" agent using https://fuzzy.ai/

## Configuration

The application integrates with both the Twitter API and the Fuzzy.ai API. You will need accounts and configuration options from both. The app is configured through environment variables.

### Create a twitter application

* Visit apps.twitter.com, sign in and click "Create New App".
* Complete the form with appropriate values, then click on "Keys and Access Tokens"
* From the "Application Settings" section under the Keys and Access Tokens tab, copy the following environment variables:
  * "Consumer Key (API Key)" as TWITTER_CONSUMER_KEY
  * "Consumer Secret (API Secret)" as TWITTER_CONSUMER_SECRET
* From the "Your Access Token" section, copy the following values:
  * "Access Token" as TWITTER_ACCESS_TOKEN
  * "Access Token Secret" as TWITTER_ACCESS_SECRET

### Create a Fuzzy.ai Agent

* If you haven't done so already, create an account at https://fuzzy.ai/signup and log in.
* From your fuzzy.ai dashboard, copy your api key to the environment variable FUZZY_API_KEY.
* Visit https://fuzzy.ai/agents/new/tweet-relevance and click "Create".
* Copy the agent ID from the newly created agent to the environment variable FUZZY_AGENT_ID

## Deploy

### Heroku

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

After clicking the button above, you will be prompted for the configuration variables from the previous section.

### Docker Cloud

Before you deploy to Docker Cloud, make sure you have an account and are logged in: at [https://cloud.docker.com/](https://cloud.docker.com/)

[![Deploy to Docker Cloud](https://files.cloud.docker.com/images/deploy-to-dockercloud.svg)](https://cloud.docker.com/stack/deploy/)

After clicking the button above, you will have an opportunity to edit the with the values from the previous section.

### Local installation

#### Requirements

* Ruby >= 2.2.2 (Use [rvm](http://rvm.io/) to get recent ruby versions)
* Bundler (`gem install bundler`)
* Postgresql

#### Steps

1. Clone the repository
1. Run `bundle install`
1. Run `bundle exec rails db:create`
1. Create a .env based on env.sample (`cp env.sample .env`)
1. Run `bundle exec rails server`
1. Load the site at http://localhost:3000/
