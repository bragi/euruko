require 'spec_helper'

describe PasswordResetsController do

  #Delete these examples and add some real ones
  it "should use PasswordResetsController" do
    controller.should be_an_instance_of(PasswordResetsController)
  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @user = Factory.create(:user)
    end
    it "should be successful" do
      get 'edit', :id => @user.perishable_token
      response.should be_success
    end
  end
end
