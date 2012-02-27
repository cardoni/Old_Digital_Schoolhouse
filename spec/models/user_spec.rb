require 'spec_helper'

describe User do
    before { @user = User.new(name: "Example User", email: "user@example.com",  password_digest: "$2a$10$l2ZvnTqVQRCjAFqSjyyJhekqXJrAY8HpfMLaJ6h5YBCnLtWPgurIK") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
end
