require 'spec_helper'

describe "/home/index" do
  before(:each) do
    render 'home/index'
  end

  it "should have registration form" do
    response.should have_tag('form[action=?]', users_path)
  end
end
