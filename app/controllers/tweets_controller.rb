# app/controllers/tweets_controller.rb
class TweetsController < ApplicationController
  before_action :ensure_config, only: [:index]
  before_action :initialize_twitter, only: [:index]
  before_action :initialize_fuzzy, only: [:index]

  def index
    timeline = @twitter.home_timeline
    inputs = get_inputs(timeline)
    results, = @fuzzy.evaluate(ENV['FUZZY_AGENT_ID'], inputs)
    if results.key?('status') && results['status'] == 'error'
      @tweets = []
      @error = results['message']
    else
      @tweets = sort_timeline(timeline, results)
    end
  end

  def setup
  end

  private

  def ensure_config
    %w(TWITTER_CONSUMER_KEY TWITTER_CONSUMER_SECRET
       TWITTER_ACCESS_TOKEN TWITTER_ACCESS_SECRET
       FUZZY_API_KEY FUZZY_AGENT_ID).each do |key|
      if ENV[key].blank?
        redirect_to :setup
        break
      end
    end
  end

  def initialize_twitter
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end

  def initialize_fuzzy
    @fuzzy = FuzzyAi::Account.new ENV['FUZZY_API_KEY']
  end

  def get_inputs(tweets)
    inputs = []
    tweets.each do |tweet|
      inputs.push(
        'Number of likes' => tweet.favorite_count,
        'Number of shares' => tweet.retweet_count,
        'Age in minutes' => helpers.age_in_minutes(tweet.created_at).to_f
      )
    end
    inputs
  end

  def sort_timeline(timeline, results)
    # create a hash of tweets with relevance score as the key
    rel = Hash[timeline.map.with_index { |t, i| [results[i]['relevance'], t] }]
    # sort the hash by key and reverse (highest score is most relevant)
    @tweets = Hash[rel.sort_by { |k, _| k }.reverse]
  end
end
