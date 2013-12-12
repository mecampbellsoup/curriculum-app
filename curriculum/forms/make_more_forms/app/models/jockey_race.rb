class JockeyRace < ActiveRecord::Base
  belongs_to :jockey
  belongs_to :race
end
