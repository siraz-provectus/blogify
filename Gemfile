source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'unicorn'
gem "foreman"

gem 'pg'
gem "postgres_ext"
gem "pg_array_parser"

gem "devise", "~> 3.2.0"
gem "simple_form", "~> 3.0.0"
gem "kaminari"
gem 'bootstrap-kaminari-views'
gem "searchlight"
gem 'ancestry'
gem 'acts-as-taggable-on'
gem 'ckeditor'
gem 'truncate_html'

gem "sass-rails", "~> 4.0.0"
gem "coffee-rails", "~> 4.0.0"
gem "uglifier", ">= 1.3.0"
gem "execjs"
gem 'therubyracer', platforms: :ruby

gem "bootstrap-sass", ">= 3.0.0.0"
gem "jquery-rails"
gem "jquery-ui-rails"

gem "draper"
gem "decent_exposure", "~>2.3.0"
gem "decent_decoration"

gem "slim-rails"

gem 'activerecord_any_of'
gem "pundit"

group :development do
  gem "better_errors"
  gem "binding_of_caller", platforms: [:mri_19, :mri_20, :rbx]
  gem "bullet"
end

group :test do
  gem "capybara"
  gem "poltergeist"
  gem "launchy"
  gem "headless"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
  gem "brakeman", require: false
  gem "timecop"
  gem "database_cleaner"
end

group :development, :test do
  gem "factory_girl_rails"
  gem "quiet_assets"
  gem "pry-rails"
  gem "rspec-rails", "~> 2.14.0"
end

gem 'faker', group: [ :development, :staging, :cucumber, :test ]

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
