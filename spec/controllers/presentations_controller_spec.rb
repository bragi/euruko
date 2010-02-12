require 'spec_helper'

describe PresentationsController do
  describe "GET 'show'" do
    it "should be unauthorized for not owned page" do
      presentation = Factory.create(:presentation)
      user = Factory.create(:user)
      user.should_not == presentation.user
      login_user(user)
      get :show, :id => presentation.id
      response.status.should == "401 Unauthorized"
    end
  end
end
