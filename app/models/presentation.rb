class Presentation < ActiveRecord::Base
  validates_inclusion_of :length, :in => ["standard", "long", "lightning"]

  validates_presence_of :topic
  validates_presence_of :description
  validates_presence_of :user

  belongs_to :user

  before_validation :assign_user
  after_validation :add_speaker_email_errors

  attr_accessor :speaker_email

  alias owner user

  def assign_user
    self.user = User.find_by_email(speaker_email) unless user
  end

  def add_speaker_email_errors
    errors.add(:speaker_email, "Does not belong to registered user") if user.blank?
  end
end
