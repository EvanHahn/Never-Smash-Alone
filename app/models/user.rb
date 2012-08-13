class User < ActiveRecord::Base
  attr_accessible :lat, :lon, :name
end
