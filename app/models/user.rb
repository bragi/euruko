class User < ActiveRecord::Base
  acts_as_authentic

  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :presentations, :dependent => :destroy
  has_one :billing_information
end
