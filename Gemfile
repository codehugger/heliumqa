source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'puma', '~> 3.7'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# gem 'webpacker'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Generate Entity-Relationship Diagrams for Rails applications
  gem 'rails-erd'
  # Rails >= 3 pry initializer
  gem 'pry-rails'
end

group :production do
  # Abort requests that are taking too long
  gem 'rack-timeout'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# File Attachment toolkit for Ruby applications http://shrinerb.com
gem 'shrine'
# Routing Tree Web Toolkit http://roda.jeremyevans.net
gem 'roda'
# The official AWS SDK for Ruby. http://aws.amazon.com/sdkforruby
gem 'aws-sdk-s3'
# Library for reading, editing and writing DICOM files.
gem 'dicom', github: 'dicom/ruby-dicom'
# High-level helpers for image processing with ImageMagick
gem 'image_processing'
gem 'mini_magick', '>= 4.3.5'
# Create beautiful JavaScript charts with one line of Ruby https://www.chartkick.com
gem 'chartkick'
# Bunny is a popular, easy to use, mature Ruby client for RabbitMQ (3.3+) http://rubybunny.info
gem 'bunny'
# Simple Rails app configuration
gem 'figaro'

# Collection of extensions frequently used in Spectralis projects.
gem 'spectralis_ext', github: 'spectralis/spectralis_ext'

# Inspinia
gem 'bootstrap-sass', '~> 3.3.7'
gem 'font-awesome-rails', '~> 4.7.0.1'
gem 'bootstrap-datepicker-rails'

# Decorators/View-Models for Rails Applications
gem 'draper'

# Simple, efficient background processing for Ruby http://sidekiq.org
gem 'sidekiq'

# Devise is a flexible authentication solution for Rails based on Warden.
gem 'devise'

# A Rails engine that helps you put together a super-flexible admin dashboard. https://administrate-prototype.herokuapp.com
gem 'administrate', github: 'thoughtbot/administrate'

# A gem that lets you stream a zip file from rails
gem 'zipline'

# FriendlyId is the “Swiss Army bulldozer” of slugging and permalink plugins for ActiveRecord
gem 'friendly_id'

# Dynamic nested forms using jQuery made easy; works with formtastic, simple_form or default forms http://github.com/nathanvda/cocoon
gem 'cocoon'

# math and logic formula parser and evaluator
gem 'dentaku'

# Rails Assets (https://rails-assets.org)
gem 'rails-assets-toastr', source: 'https://rails-assets.org'

# Mustache
gem 'mustache', '~> 1.0'

# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard. http://jwt.github.io/ruby-jwt/
gem 'jwt'

# Upsert for Rails 5 / Active Record 5
gem 'active_record_upsert'
