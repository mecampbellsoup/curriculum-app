class Snippet < ActiveRecord::Base
  attr_accessible :code, :language, :name, :feature_id, :url, :description, :position
  
  belongs_to :feature

  validates_presence_of :description, :message => ("Please fill in a description.")
  validates_presence_of :code
  validates_presence_of :name
  validates_presence_of :language, :message => ("Please select which languages you used in this feature")
  
  def shift_position(index)
    self.position = index.to_i + 1
  end

end
