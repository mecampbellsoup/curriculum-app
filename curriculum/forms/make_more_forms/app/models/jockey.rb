class Jockey < ActiveRecord::Base
  attr_accessible :height, :name, :shoe_size
  has_many :jockey_races
  has_many :races, :through => :jockey_races
end
