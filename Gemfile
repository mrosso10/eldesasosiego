source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.2"

gem "active_type"
gem "autoprefixer-rails"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "coffee-rails"
gem "pg", ">= 0.18"
gem "pgcli-rails"
gem "puma", "~> 3.11"
gem "rack-canonical-host", "~> 1.0"
gem "rails", "~> 6.0.0"
gem "redis", "~> 4.0"

gem 'sassc-rails'
gem 'sprockets'
gem 'sprockets-rails', :require => 'sprockets/railtie'

gem "sidekiq"
gem "turbolinks", "~> 5"


gem 'slim-rails'
gem 'chosen-rails'
gem 'database_cleaner'

gem 'devise-async'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'devise_invitable'


gem 'smart_listing', git: 'https://github.com/mrosso10/smart_listing.git', tag: 'v2.0.0'


gem 'pg_rails', git: 'https://github.com/programandoarg/pg_rails.git', ref: '3d7e0c8184861f0cacbb09ad82fd73e9da179767'
gem 'pg_mantenimiento', git: 'https://github.com/programandoarg/pg_mantenimiento.git', ref: 'e0aeae66ad02b0035ee47f1035c8be9046e1cbdb'


source 'https://rails-assets.org' do
  gem 'rails-assets-handlebars'
  gem 'rails-assets-typeahead.js'
  gem 'rails-assets-jquery-steps'
  gem 'rails-assets-jquery-validation'
end

gem 'jquery-rails'

group :production do
  gem "postmark-rails"
end

group :development do
  gem "amazing_print"
  gem "annotate"
  gem "guard", require: false
  gem "guard-minitest", require: false
  gem "letter_opener"
  gem "listen", ">= 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "terminal-notifier", require: false
  gem "terminal-notifier-guard", require: false
  gem "web-console", ">= 3.3.0"
end

group :development, :test do
  gem 'factory_bot_rails'
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "byebug"
  gem "dotenv-rails"
  gem "launchy"
  gem "rubocop", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem 'rspec-rails', '~> 3.5'
  gem 'faker'
end

group :test do
  gem "capybara", ">= 2.15"
  gem "minitest-ci", require: false
  gem "selenium-webdriver"
  gem "shoulda-context"
  gem "shoulda-matchers"
  gem "webdrivers"
end

gem 'tinymce-rails'
#gem 'tinymce-rails-imageupload', github: 'PerfectlyNormal/tinymce-rails-imageupload'


gem 'carrierwave', '>= 2.0.0.rc', '< 3.0'
gem 'carrierwave-magic'
gem "fog-aws"
gem 'friendly_id', '~> 5.2.4'
