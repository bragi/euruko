require 'spec_helper'

describe Admin do
  it "should create a new instance given valid attributes" do
    Admin.create!(Factory.attributes_for(:admin))
  end
end
