class User < ActiveRecord::Base
  attr_accessible :lat, :lon, :name
  validates_presence_of :name
  validates_presence_of :lat
  validates_presence_of :lon
end
