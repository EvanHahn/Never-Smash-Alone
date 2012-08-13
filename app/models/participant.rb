class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  # TODO dependent clauses
end
