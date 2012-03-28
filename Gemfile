source 'https://rubygems.org'

gem 'rails', '3.2.1'

gem 'pg'

group :development, :test do
  gem 'rspec-rails', '2.8.1'
  # gem 'ruby-debug19', :require => 'ruby_debug'
end

group :test do
  gem 'capybara', '1.1.2'
  gem 'factory_girl_rails', '1.4.0'
  gem 'cucumber-rails', '1.2.1'
  gem 'database_cleaner', '0.7.0'
end

# auto_html gives us embed html code for attachments
  gem 'auto_html'

# Thin webserver instead of default webrick
  gem 'thin'

# group :assets do
  gem 'sass-rails',   '3.2.3'
  gem 'coffee-rails', '3.2.1'
  gem "haml-rails", '0.3.4'
  gem 'mini_magick'
  gem 'nested_form'
  gem 'compass-rails'
  gem 'compass_twitter_bootstrap', :git => 'git://github.com/vwall/compass-twitter-bootstrap.git'
  gem 'compass-colors'
  gem 'sassy-buttons'
  gem 'uglifier', '1.0.3'
# end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '3.0.1'

gem 'vimeo'
# The 3 below are for dragonfly with S3 sync
gem 'fog'
gem 'dragonfly', '~>0.9.10'
gem 'rack-cache', :require => 'rack/cache'

# To validate email address format
gem 'validates_email_format_of', '1.5.3'

# SEO-RELATED PLUGINS
# 
# This ensures NO trailing slash ("/") is added to end of URL (for SEO purposes)
gem 'rack-rewrite', '1.2.1'
# Generates SEO-friendly URL slugs
gem 'friendly_id', '4.0.1'

# for the tweet button
gem 'tweet-button'