require 'spec_helper'

describe BillingInformationsController do
  describe "GET 'show'" do
    it "should be unauthorized for not owned page" do
      billing_information = Factory.create(:billing_information)
      user = Factory.create(:user)
      user.should_not == billing_information.user
      login_user(user)
      get :show, :id => billing_information.id
      response.status.should == "401 Unauthorized"
    end
  end
end
