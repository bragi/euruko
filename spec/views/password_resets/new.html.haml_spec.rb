require 'spec_helper'

describe "/password_resets/new" do
  before(:each) do
    render 'password_resets/new'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag("form[action=?]", password_reset_path)
  end
end
