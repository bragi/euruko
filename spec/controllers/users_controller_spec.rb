require 'spec_helper'

describe UsersController do
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "GET 'show'" do
    it "should be unauthorized for not owned page" do
      user1 = Factory.create(:user)
      user2 = Factory.create(:user)
      login_user(user1)
      get :show, :id => user2.id
      response.status.should == "401 Unauthorized"
    end
  end
end
