require 'spec_helper'

describe "/password_resets/edit" do
  before(:each) do
    assigns[:user] = @user = Factory.create(:user)
    render 'password_resets/edit'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag("form[action=?]", password_reset_path(:id => @user.perishable_token))
  end
end
