require 'spec_helper'

describe BillingInformation do
  it "should create a new instance given valid attributes" do
    BillingInformation.create!(Factory.attributes_for(:billing_information, :user => Factory.create(:user)))
  end
end
