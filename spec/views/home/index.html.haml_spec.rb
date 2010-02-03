require 'spec_helper'

describe "/home/index" do
  before(:each) do
    render 'home/index'
  end

  it "should have welcome header" do
    response.should have_tag('h1', %r[Welcome to Euruko])
  end
end
