source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "active_type"
gem "autoprefixer-rails"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "coffee-rails"
gem "pg", ">= 0.18"
gem "pgcli-rails"
gem "puma", "~> 3.11"
gem "rack-canonical-host", "~> 1.0"
gem "rails", "~> 6.1"
gem "redis", "~> 4.0"

gem 'sassc-rails'
gem 'sprockets'
gem 'sprockets-rails', :require => 'sprockets/railtie'

gem "sidekiq"
gem "turbolinks", "~> 5"

# Text from PDFs
gem 'pdf-reader'
gem 'rtesseract'

gem 'slim-rails'
gem 'chosen-rails'
gem 'database_cleaner'

gem 'devise-async'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'devise_invitable'

gem 'smart_listing', git: 'https://github.com/mrosso10/smart_listing.git', ref: '7230bb4'
gem "best_in_place", git: "https://github.com/bernat/best_in_place"

# gem 'pg_rails', path: '/proyectos/pg_rails'
gem 'pg_rails', git: 'https://github.com/programandoarg/pg_rails.git', ref: '9c79f2a7c2cbdd09b9d2664ab4d4b59437334e83'
gem 'pg_mantenimiento', git: 'https://github.com/programandoarg/pg_mantenimiento.git', ref: 'bb24abd4146900211307c62a4af387e6363e0982'

gem 'discard'

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
  gem "capistrano", "~> 3.6"
  gem "capistrano3-puma"
  gem "capistrano-bundler"
  gem "capistrano-postgresql", "~> 4.2.0"
  gem "capistrano-rails", "~> 1.1"
  gem "capistrano-rails-db"
  gem "capistrano-rake"
  gem "capistrano-rbenv", "~> 2.0"
  gem "capistrano-sidekiq"

  gem "amazing_print"
  gem "annotate"
  gem "guard", require: false
  gem "guard-minitest", require: false
  gem "letter_opener"
  gem "listen", ">= 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem 'spring-commands-rspec'
  gem "terminal-notifier", require: false
  gem "terminal-notifier-guard", require: false
  gem "web-console", ">= 3.3.0"
end

gem "dotenv-rails"

group :development, :test do
  gem 'factory_bot_rails'
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "byebug"
  gem "launchy"
  gem "rubocop", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem 'rspec-rails', '~> 4.0'
  gem 'rails-controller-testing'
  gem 'fuubar'

  gem 'faker'
  gem 'slim_lint'
end

group :test do
  gem "capybara", ">= 2.15"
  gem "minitest-ci", require: false
  gem "selenium-webdriver"
  gem "shoulda-context"
  gem "shoulda-matchers"
  gem "webdrivers"

  gem 'simplecov', '~> 0.17.1'
end

gem 'tinymce-rails', '~> 4.0'
gem 'tinymce-rails-imageupload', github: 'PerfectlyNormal/tinymce-rails-imageupload'


gem 'carrierwave', '>= 2.0.0.rc', '< 3.0'
gem 'carrierwave-magic'
gem "carrierwave-aws"

gem 'friendly_id', '~> 5.2.4'
gem "recaptcha"
gem 'browser', '2.0.3'

gem 'rollbar'
