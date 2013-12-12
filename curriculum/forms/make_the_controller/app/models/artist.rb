class Artist < ActiveRecord::Base
  attr_accessible :name, :birth_year
  has_many :songs
end
