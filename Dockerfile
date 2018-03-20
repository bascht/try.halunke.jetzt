FROM ruby:2.4.3

RUN curl -fsSL get.docker.com | sh && \
    apt-get update -qq && apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

ENV HALUNKE_IMAGE="moonglum/halunke:v0.6.2"
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
