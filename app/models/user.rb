class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :latitude, :longitude, :email, :password, :password_confirmation, :remember_me
  validates_presence_of :name, :email
  validates_numericality_of :latitude # TODO less_than, greater_than
  validates_numericality_of :longitude

  has_many :messages_out, :foreign_key => :sender_id, :class_name => Message
  has_many :messages_in, :foreign_key => :recipient_id, :class_name => Message
  def messages
    messages_out + messages_in
  end

end
