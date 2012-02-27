class SessionsController < ApplicationController
  skip_before_filter :login_user!, :only => [:new, :create]
  
  def new
    
  end
  
  def create
    user = User.find_by_email(params[:email])
         if user.present?
           if user.authenticate(params[:password])
             session[:user] = user.id
             redirect_to root_url
           else
          redirect_to new_session_url, :notice => "Incorrect login. Please try again."
             end
           else
             redirect_to new_session_url, :notice => "Incorrect login. Please try again"
           end
  end
  
  def logout
   reset_session
   redirect_to :root
  end
  
end