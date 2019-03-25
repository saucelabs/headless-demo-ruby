FROM ruby:2.6

WORKDIR /app

RUN gem install bundler
# Add Gemfile first so we don't reinstall every time anything changes
ADD Gemfile Gemfile.lock /app/
RUN bundle install

ADD . .

CMD bundle exec rake sauce_demo