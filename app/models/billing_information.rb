class BillingInformation < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :taxid
  
end
