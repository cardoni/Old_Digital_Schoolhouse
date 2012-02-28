source 'https://rubygems.org'

gem 'rails', '3.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '2.8.1'
end

group :test do
  gem 'capybara', '1.1.2'
end

# auto_html gives us embed html code for attachments
  gem 'auto_html'

# Thin webserver instead of default webrick
  gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.3'
  gem 'coffee-rails', '3.2.1'
  gem "haml-rails", "0.3.4"
  gem 'carrierwave'
  gem 'mini_magick'
  gem "nested_form"
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '3.0.1'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'validates_email_format_of', '1.5.3'

