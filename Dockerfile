FROM ruby:2.6.6
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -yqq apt-utils nodejs postgresql-client yarn

RUN mkdir /pixeler
WORKDIR /pixeler

COPY Gemfile /pixeler/Gemfile
COPY Gemfile.lock /pixeler/Gemfile.lock
COPY package.json yarn.lock ./
COPY . /pixeler

RUN bundle check || bundle install
RUN yarn install --check-files
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
