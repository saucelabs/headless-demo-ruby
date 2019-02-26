FROM ruby:2.6-alpine

WORKDIR /app
RUN apk add --update build-base libffi-dev
RUN gem install bundler
# Add Gemfile first so we don't reinstall every time anything changes
ADD Gemfile Gemfile.lock /app/
RUN bundle install

ADD . .

CMD bundle exec rake sauce_demo