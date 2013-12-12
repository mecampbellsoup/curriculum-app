class Ingredient < ActiveRecord::Base
  attr_accessible :amount, :name, :recipe_id
  belongs_to :recipe
end
