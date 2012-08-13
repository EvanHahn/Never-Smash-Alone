class Message < ActiveRecord::Base

  attr_accessible :body

  has_many :participants
  has_many :sender_participants, :class_name => Participant, :conditions => { :sender => true }
  has_many :senders, :through => :sender_participants, :source => :user
  has_many :users, :through => :participants

  def sender
    senders.limit(1).first
  end

  # TODO dependent clauses

end
