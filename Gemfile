source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.rc1', '< 5.1'
# Use sqlite3 as the database for Active Record
gem 'pg'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "active_model_serializers", github: "rails-api/active_model_serializers", tag: "v0.10.0.rc5"
gem 'bcrypt'
# gem 'jbuilder'
gem 'redis'
gem 'responders'
gem 'dotenv-rails'
gem 'bcrypt-ruby', '3.1.2'
gem 'doorkeeper'


group :development do
  gem 'better_errors'
  gem 'letter_opener'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'guard-livereload'
  gem 'guard-rspec'
  gem 'rb-fsevent' # For mac – if using Linux add rb-inotify
  gem 'rspec-rails'
  gem 'timecop'

  # Debugging
  gem 'pry'
  gem 'pry-remote'
  gem 'binding_of_caller' # allows cmd-line in browser
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'shoulda-matchers'

  # Drivers
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
end