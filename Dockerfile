FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs mysql-client default-libmysqlclient-dev
RUN gem install bundler -v 2.0.1
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN pwd & bundle install
COPY . /myapp
ENV RAILS_ENV development

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
#COPY config/docker/ /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
#RUN chmod +x /usr/bin/startup.sh
#ENTRYPOINT ["entrypoint.sh", "./config/docker/startup.sh"]
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

