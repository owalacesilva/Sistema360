source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.7'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# Use sqlite3 as the database for Active Record
gem 'mysql2'
# Use Puma as the app server
gem "puma", github: "puma/puma", branch: "master"
# Use Bootstrap SCSS
gem 'bootstrap', '~> 5.1.0'
# Use PopperJs
gem 'popper_js', '~> 2.9.3'
# Use Jquery
gem 'jquery-rails'
# Use FontAwesome
gem "font-awesome-rails"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use devise
gem 'devise'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem "simple_command"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "guard-rspec"                  # Roda os testes automaticamente
  gem "launchy"                      # Permite que o RSpec abra o navegador
  gem "pry-byebug"
  gem "reek"
  gem "rspec-activemodel-mocks"
  gem "rspec-collection_matchers"
  gem "rspec-its"
  gem "rspec-rails"                  # Framework de desenvolvimento orientado ao comportamento
  gem "rspec-retry"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "solargraph", require: false
end
gem "factory_bot_rails", git: "https://github.com/thoughtbot/factory_bot_rails", branch: "master"
gem "faker",             git: "https://github.com/stympy/faker",                 branch: "master"

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem "capistrano", "~> 3.10.0"
  gem "capistrano-bundler", "~> 1.2"
  gem "capistrano-faster-assets"
  gem "capistrano-passenger"
  gem "capistrano3-delayed-job", "~> 1.0"
  gem "capistrano3-puma"
  gem "capistrano-rvm"
  gem "capistrano-rails", "~> 1.2"
  gem "capistrano-rbenv", "~> 2.0"
  gem "capistrano-yarn"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem "mock_redis"
  gem "selenium-webdriver"
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
  gem "simplecov-json", require: false
  gem "vcr", require: false
  gem "webdrivers", require: false
  gem "webmock"
  
  gem "database_cleaner-active_record"
  gem "rails-controller-testing"
end

group :assets, :production do
  gem 'therubyracer'
  # Use SCSS for stylesheets
  gem 'sass-rails', '>= 6'
  gem 'uglifier'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
