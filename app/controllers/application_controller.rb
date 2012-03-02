class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  before_filter :login_user!
  
  # def :login_user
  #         if session[:user].blank?
  #             redirect_to root_url, :notice => "Please sign in."
  #         end
  #   end
  
    
end
