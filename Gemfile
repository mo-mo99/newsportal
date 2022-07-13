# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"

gem "pg", "~> 1.1"
gem "rails", "~> 7.0.3"

gem "bootsnap", require: false
gem "devise"
gem "httparty"
gem "importmap-rails"
gem "jbuilder"
gem "json", "~> 2.6", ">= 2.6.2"
gem "puma", "~> 5.0"
gem "rubocop", "~> 1.31", require: false
gem "rubocop-rails"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"

group :development, :test do
  gem "debug", platforms: %i(mri mingw x64_mingw)
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
