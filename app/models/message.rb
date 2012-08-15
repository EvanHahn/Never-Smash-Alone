class Message < ActiveRecord::Base

  attr_accessible :body, :recipient, :read

  belongs_to :sender, :class_name => User
  belongs_to :recipient, :class_name => User

  scope :read, where(:read => true)
  scope :unread, where(:read => false)
  scope :with, lambda { |id| where('sender_id = ? or recipient_id = ?', id, id) }

  def mark_read!
    update_attribute :read, true
  end

  # TODO dependent clauses
  # TODO read-only attributes

end
