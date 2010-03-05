require 'spec_helper'
require 'digest/md5'

describe "Payments" do
  before(:each) do
    @user = Factory.create(:user)
    login_user(@user)
  end

  it "should be successful" do
    get "/users/#{@user.id}/payment"
    response.should have_tag("form[action=?]", "https://ssl.dotpay.pl/")
    post "/users/#{@user.id}/payment_confirmations", payment_confirmation_parameters("1")
  end
  
  def payment_confirmation_parameters(t_status)
    pin = "1234567890abcdef"
    id = 100
    service = ""
    code = ""
    username = ""
    password = ""
    md5 = Digest::MD5.hexdigest([pin, id, service, code, username, password, t_status].join(":"))
    
    {:id => id, :status => status, :t_id => "1", :amount => "40.00", 
      :original_amount => "40.00", :email => "doe@example.com", :t_status => t_status, 
      :description => "Euruko 2010 payment", :md5 => md5, :p_info => "p_info",
      :p_email => "p_email", :t_date => "2010-04-04 22:22:33"}
  end
end
