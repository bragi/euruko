require 'spec_helper'

describe PaymentConfirmation do
  it "should create a new instance given valid attributes" do
    pc = PaymentConfirmation.new(Factory.attributes_for(:payment_confirmation))
    pc.save
  end
end
