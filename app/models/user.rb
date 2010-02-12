class User < ActiveRecord::Base
  include Authenticable

  has_many :presentations, :dependent => :destroy
  has_one :billing_information
end
