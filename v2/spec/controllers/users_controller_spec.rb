require 'spec_helper'

describe UsersController do
    subject { page }

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'show'" do
    
    it "should be successful" do
        puts @user.to_s
      get :manage, :id => @user.id
      response.should be_success
      # puts page.html
    end
    
    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
    
  end

end
