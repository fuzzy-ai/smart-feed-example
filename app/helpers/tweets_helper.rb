# app/helpers/tweets_helper.rb
module TweetsHelper
  def age_in_minutes(time)
    number_with_precision((Time.now - time) / 60, precision: 2)
  end
end
