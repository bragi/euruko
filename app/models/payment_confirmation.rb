class PaymentConfirmation < ActiveRecord::Base
  belongs_to :payment
  
  validates_presence_of :payment
  validates_presence_of :seller_id
  validates_presence_of :status
  validates_presence_of :t_id
  validates_presence_of :amount
  validates_presence_of :original_amount
  validates_presence_of :email
  validates_presence_of :t_status
  validates_presence_of :description
  validates_presence_of :md5
  validates_presence_of :t_date
end
