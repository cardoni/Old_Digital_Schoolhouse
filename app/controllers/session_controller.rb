class SessionController < ApplicationController
  def new
      # @user = User.new
      @title = "Sign in"
      
  end

  def create
      # user = User.authenticate(params[:session][:username],params[:session][:password])
      # if user.nil?
      user = User.find_by_username(params[:session][:username])
      if user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash.now[:error] = "Invalid email/password combination."
          @title = "Sign in"
          redirect_to articles_path
          # redirect_back_or user
      else
          
          render 'new'
      end
      # render 'new'
=begin    
    user = User.find_by_email(params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
    end
=end    
  end

  def destroy
    reset_session
  end

end

