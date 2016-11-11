FROM ruby:2.3.1

WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential nodejs

# install gems
COPY Gemfile* /app/
RUN bundle install

ADD . /app

CMD ["rails", "server", "-b", "0.0.0.0"]
