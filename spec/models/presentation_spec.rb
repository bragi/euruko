require 'spec_helper'

describe Presentation do
  before do
    @user = Factory.create(:user)
  end

  describe "when user provided during creation" do
    it "should create a new instance given valid attributes" do
      Presentation.create!(Factory.attributes_for(:presentation, :user => @user))
    end
  end

  describe "when no user provided during creation" do
    describe "but valid speaker email provided" do
      before do
        attributes = Factory.attributes_for(:presentation, :user => nil,
              :speaker_email => @user.email)
        @presentation = Presentation.create(attributes)
      end

      it "should create new record" do
        @presentation.new_record?.should be_false
      end

      it "should assign correct user during creation" do
        @presentation.user.should == @user
      end
    end

    it "should have error on speaker email with non existing speaker email" do
      attributes = Factory.attributes_for(:presentation, :user => nil,
            :speaker_email => "unknown@example.com")
      presentation = Presentation.create(attributes)
      presentation.errors.on(:speaker_email).should_not be_blank
    end
  end
end
