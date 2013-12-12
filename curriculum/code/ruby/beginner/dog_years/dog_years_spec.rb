require './dog_years'

describe Dog, "#age_in_years" do

  it "should return an Integer" do
    Dog.new.age_in_years.should be_a_kind_of(Integer)
  end
end

describe Dog, "#age_in_days" do
  let(:dog) { Dog.new }

  it "should return the dog's age in years time 365" do
    dog.age_in_days.should eq(dog.age_in_years * 365)
  end

end

describe Dog, "#age_in_dog_years" do
  let(:dog) { Dog.new }

  it "should return the dog's age in years times 7" do
    dog.age_in_dog_years.should eq(dog.age_in_years * 7)
  end
  
end