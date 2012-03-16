require 'spec_helper'

describe Country do

  before { @country = Country.new(name: "USA!! USA!!") }

  subject { @country }

  it { should respond_to(:name) }

  describe "when name is not present" do
    before { @country.name = " " }
    it { should_not be_valid }
  end





end
