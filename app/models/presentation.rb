class Presentation < ActiveRecord::Base
  validates_inclusion_of :length, :in => ["1 hour", "2 hours", "lightning talk"]

  validates_presence_of :topic
  validates_presence_of :description
  validates_presence_of :user
  
  belongs_to :user
end
