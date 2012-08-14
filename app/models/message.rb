class Message < ActiveRecord::Base

  attr_accessible :body, :recipient, :read

  belongs_to :sender, :class_name => User
  belongs_to :recipient, :class_name => User

  scope :read, where(:read => true)
  scope :unread, where(:read => false)

  def mark_read
    self.read = true
    self.save
  end

  # TODO dependent clauses

end
