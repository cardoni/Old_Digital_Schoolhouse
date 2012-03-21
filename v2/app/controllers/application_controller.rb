class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :login_user!, except: [:show]
  
  http_basic_authenticate_with :name => "secret", :password => "password"
  
end