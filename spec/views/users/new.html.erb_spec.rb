require 'spec_helper'

describe "/users/new" do
  before(:each) do
    render 'users/new'
  end

  #Delete this example and add some real ones or delete this file
  it "allows to create new user" do
    response.should have_tag('form[action=?]', users_path)
  end
end
