# Define a class `Dog` that randomly assigns an `age` to an integer between 1
# and 14. This will represent the years. Then create three methods
# `age_in_years`, `age_in_days`, and `age_in_dog_years` that return the 
# appropriate manipulated age. 
#
# Use your class to calculate how long a "dog day" is.
#
# To test this, run `rspec dog_years_spec.rb` in your terminal.
#
# Challenge: refactor your code to not use instance variables.

class Dog
  attr_reader :age

  def initialize
    @age = rand(1..14)
  end

  def age_in_years
    age
  end

  def age_in_days
    age * 365
  end

  def age_in_dog_years
    age * 7
  end
end