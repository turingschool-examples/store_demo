source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.13'
gem 'jquery-rails'
gem 'rake'
gem 'bootstrap-sass'
gem 'simple_form'
gem 'jquery-rails'
gem 'sorcery'
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'
gem 'newrelic_rpm'
gem 'will_paginate'
gem 'ruby-progressbar'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

group :development do
  gem 'unicorn'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'cane'
  gem 'reek'
  gem 'debugger'
  gem 'capybara'
  gem 'simplecov'
  gem 'quiet_assets'
  gem 'poltergeist'
end

group :test do
  gem 'poltergeist'
  gem 'faker'
  gem 'guard-rspec'
  gem 'launchy'
end
