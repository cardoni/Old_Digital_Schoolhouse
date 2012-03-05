# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run DigitalSchoolhouse::Application

# This ensures NO trailing slash ("/") is added to end of URL (for SEO purposes)
require 'rack-rewrite'
  use Rack::Rewrite do
    r301 %r{^/(.*)/$}, '/$1'
  end