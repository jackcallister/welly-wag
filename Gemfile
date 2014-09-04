source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'active_model_serializers'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# User authentication
gem 'devise'

# Pagination
gem 'kaminari'

# Markdown parser
gem 'redcarpet'

# Use slugs for ids
gem 'friendly_id'

# User authorization
gem "cancan"

group :development do
  # Use Capistrano for deployment
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
end

group :development, :test do
  # Testing suite
  gem 'rspec', '~> 3.0.0.beta2'
  gem 'rspec-rails', '3.0.0.rc1'

  gem 'rspec-legacy_formatters'

  # Easy peasy matchers
  gem 'shoulda-matchers'

  # Clean test database with database_cleaner
  gem 'database_cleaner', git: 'git@github.com:bmabey/database_cleaner.git'

  # Generate test fixtures
  gem 'factory_girl_rails'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'

  # Automate testing
  gem 'guard-rspec', require: false

  # Watch for file changes instead of polling the disk
  gem 'rb-fsevent'

  # Generate fake data
  gem 'faker'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
gem 'byebug', group: [:development, :test]
