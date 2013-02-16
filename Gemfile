source 'http://rubygems.org'

gem 'active_model_serializers'
gem 'cancan'
gem 'capistrano'
gem 'devise'
gem 'haml-rails'
gem 'jquery-rails'
gem 'mongoid'
gem 'geocoder' # must load after Mongoid.
gem 'rails', '3.2.11'
gem 'redis-rails'
gem 'sidekiq'
gem 'state_machine'
gem 'strong_parameters'
gem 'turbolinks'

group :assets do
  gem 'angularjs-rails'
  gem 'bootstrap-sass', '~> 2.3.0.0'
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'sass-rails'
  gem 'uglifier'
end

group :development, :qa, :staging, :test do
  gem 'colorize'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rest-client'
end

group :development, :qa, :staging do
  gem 'awesome_print'
  gem 'debugger', platform: :mri_19
  gem 'sextant'
  gem 'thin', platform: :mri_19
end

group :development, :test do
  gem 'guard-rspec'
  gem 'launchy'
  gem 'pry'
  gem 'pry-rescue'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'rspec-rails'
  gem 'vcr'
  gem 'webmock'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'mongoid-rspec'
  gem 'simplecov', require: false
end

