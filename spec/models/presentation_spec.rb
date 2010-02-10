require 'spec_helper'

describe Presentation do
  it "should create a new instance given valid attributes" do
    user = Factory.create(:user)
    Presentation.create!(Factory.attributes_for(:presentation, :user => user))
  end
end
