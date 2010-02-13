class User < ActiveRecord::Base
  include Authenticable

  has_many :presentations, :dependent => :destroy
  has_one :billing_information
  
  def owner
    self
  end

  def full_name
    [first_name, last_name].join(" ")
  end
end
