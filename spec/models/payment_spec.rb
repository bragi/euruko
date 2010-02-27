require 'spec_helper'

describe Payment do
  it "should create a new instance given valid attributes" do
    p = Payment.new(Factory.attributes_for(:payment))
    p.user = Factory.create(:user)
    p.save!
  end
end
