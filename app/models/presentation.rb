class Presentation < ActiveRecord::Base
  validates_inclusion_of :length, :in => ["standard", "long", "lightning"]

  validates_presence_of :topic
  validates_presence_of :description
  validates_presence_of :user
  
  belongs_to :user
  
  alias owner user
end
