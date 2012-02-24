class HomeController < ApplicationController
  skip_before_filter :login_user!
  def index
    
  end

end