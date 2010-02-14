class User < ActiveRecord::Base
  include Authenticable

  has_many :presentations, :dependent => :destroy
  has_one :billing_information
  
  def deliver_password_reset_instructions!
    reset_perishable_token!  
    PasswordMailer.deliver_instructions(self)
  end

  def full_name
    [first_name, last_name].join(" ")
  end

  def owner
    self
  end
  
end
