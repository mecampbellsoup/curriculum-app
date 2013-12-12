class Horse < ActiveRecord::Base
  attr_accessible :name, :number, :position
  has_many :horse_races
  has_many :races, :through => :horse_races
end
