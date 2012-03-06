source 'https://rubygems.org'

gem 'rails', '3.2.1'

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

group :assets do
  gem 'sass-rails',   '3.2.3'
  gem 'coffee-rails', '3.2.1'
  gem "haml-rails", "0.3.4"
  gem 'carrierwave'
  gem 'mini_magick'
  gem 'nested_form'
  gem 'compass-rails', '~> 1.0.0.rc.2'
  gem 'compass-colors'
  gem 'uglifier', '1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '3.0.1'

# To validate email address format
gem 'validates_email_format_of', '1.5.3'

# SEO-RELATED PLUGINS
# 
# This ensures NO trailing slash ("/") is added to end of URL (for SEO purposes)
gem 'rack-rewrite', '1.2.1'
# Generates SEO-friendly URL slugs
gem 'friendly_id', '4.0.1'
