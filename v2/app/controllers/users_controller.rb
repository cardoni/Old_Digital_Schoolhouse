class UsersController < ApplicationController
  # skip_before_filter :login_user!, :only => [:new, :create]
  
  def new
   @user = User.new
  end

  
  def create
     @user = User.new(params[:user])
       respond_to do |format|
         if @user.save
           format.html { redirect_to root_url, notice: 'Thanks for signing up!' }
           format.json { render json: @user, status: :created, location: @user }
         else
           format.html { render action: "new" }
           format.json { render json: @user.errors, status: :unprocessable_entity }
       end
     end
   end
  
   def index
     @administrators = User.find_all_by_classification('administrator')
     @teachers = User.find_all_by_classification('teacher')
     @students = User.find_all_by_classification('student')
     @donors = User.find_all_by_classification('donor')
   end
   
   def edit
     
   end

   def update
     if current_user.update_attributes(params[:user])
       redirect_to root_url
     else
       redirect_to edit_user(current_user)
     end
    
   end
end