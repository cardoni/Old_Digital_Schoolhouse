class UsersController < ActionController::Base
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_index_url }
        else
        format.html { render action: "new" }
      end
    end
  end
  
  def index
    @administrators = User.find_all_by_classification('administrator')
    @teachers = User.find_all_by_classification('teacher')
    @students = User.find_all_by_classification('student')
    @donors = User.find_all_by_classification('donor')
  end
  
end