require 'spec_helper'

describe User do
  it "should create a new instance given valid attributes" do
    User.create!(Factory.attributes_for(:user))
  end
end
