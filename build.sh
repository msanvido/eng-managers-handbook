#!/bin/sh

docker build -t jekyll-handbook -f- . <<EOF
FROM mrxder/jekyll-docker-arm64:latest
COPY Gemfile ./
RUN bundle install
EOF

# Serve the handbook locally (for testing)
docker run --rm -v "$PWD:/var/jekyll" -p 4000:4000 -it jekyll-handbook jekyll serve --host=0.0.0.0