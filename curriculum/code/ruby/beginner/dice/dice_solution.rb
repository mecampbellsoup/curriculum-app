# Create a class dice with a single method `roll` that returns a random number
# between 1 and 6

#To test your solution run `rspec dice_spec.rb` in your terminal

class Dice

  def roll
    rand(1..6)
  end

end