# https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#timeout
if Rails.env.production?
  Rack::Timeout.timeout = 20  # seconds

  # Turn off unnecessary logging
  Rack::Timeout::Logger.logger = Logger.new("log/timeout.log")
  Rack::Timeout::Logger.logger.level = Logger::ERROR
end
