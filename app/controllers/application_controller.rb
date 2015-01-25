class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :login_user!, except: [:show]
  
    # if Rails.env.production?
    #   # http_basic_authenticate_with :name => "secret", :password => "password"
    #   default_url_options[:host] = 'www.schoolhouse.io'
    #   default_url_options[:trailing_slash] = false
    # end
        
end