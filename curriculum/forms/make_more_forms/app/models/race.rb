class Race < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :horse_races
  has_many :horses, :through => :horse_races

  has_many :jockey_races
  has_many :jockeys, :through => :jockey_races
end
