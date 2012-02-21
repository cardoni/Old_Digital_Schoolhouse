class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def parseURL(url)
    url.match(/youtube.com.*(?:\/|v=)(\w+)/)[1]
  end
end
