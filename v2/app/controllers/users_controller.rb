class UsersController < ApplicationController
  
  def new
   @user = User.new
   @title = "Create New User"
  end
  
  def create
     @user = User.new(params[:user])
       respond_to do |format|
         if @user.save
           format.html { redirect_to root_url, notice: 'Thanks for signing up!' }
           format.json { render json: @user, status: :created, location: @user }
         else
           format.html { render action: "new", notice: 'User was not created' }
           format.json { render json: @user.errors, status: :unprocessable_entity }
       end
     end
   end
  
   def index
     @title = "All Users"
     @administrators = User.find_all_by_classification('administrator')
     @teachers = User.find_all_by_classification('teacher')
     @students = User.find_all_by_classification('student')
     @donors = User.find_all_by_classification('donor')
   end
   
   def edit
     @user = User.find(params[:id])
     @title = "#{@user.name}\'s Profile"
   end

   def update
     if current_user.update_attributes(params[:user])
       redirect_to root_url
     else
       redirect_to edit_user(current_user)
     end
    
   end
   
   def manage
     @user = User.find(params[:id])
   end
   
   def change
     # I am entering these fields individually because I am not clear right now how to handle the avatar fields  
     user  = User.find(params[:id])
     user.name       = params[:user][:name]
     user.location   = params[:user][:location]
     user.school     = params[:user][:school]
     user.bio        = params[:user][:bio]
     user.email      = params[:user][:email]
     user.country_id = params[:user][:country_id]
     if user.save
       redirect_to users_path
     else
       redirect_to manage_user(user), notice: "user not updated"
     end

   end
   
end
