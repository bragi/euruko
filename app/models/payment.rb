class Payment < ActiveRecord::Base
  belongs_to :user
  
  attr_protected :user
  
  validates_presence_of :amount
  validates_presence_of :seller_id
  validates_presence_of :user
  validates_presence_of :description
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :email
end
