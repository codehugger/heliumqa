# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#timeout
Rack::Timeout.timeout = 20  # seconds

# Turn off unnecessary logging
Rack::Timeout::Logger.logger = Logger.new("log/timeout.log")
Rack::Timeout::Logger.logger.level = Logger::ERROR
