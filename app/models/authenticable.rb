module Authenticable
  def self.included(base)
    base.acts_as_authentic

    base.validates_presence_of :email
    base.validates_uniqueness_of :email
    base.validates_presence_of :first_name
    base.validates_presence_of :last_name
  end
end
