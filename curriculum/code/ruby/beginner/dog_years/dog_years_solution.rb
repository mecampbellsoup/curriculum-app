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