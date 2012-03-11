require 'spec_helper'

describe User do
    before { @user = User.new(name: "Example User", email: "user@example.com",  password_digest: "$2a$10$l2ZvnTqVQRCjAFqSjyyJhekqXJrAY8HpfMLaJ6h5YBCnLtWPgurIK") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email is not valid" do
      before { @user.email = "not valid at some domain dot com" }
    it { should_not be_valid }
  end
  
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
  
end


