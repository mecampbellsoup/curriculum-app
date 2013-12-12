require "./fibonacci"

describe "#fib" do

  it "should return an Integer" do
    fib(5).should be_a_kind_of(Integer)
  end

  it "should return the integer at the specified position" do
    fib(5).should eq(5)
  end

  it "should return the integer at the specified position" do
    fib(6).should eq(8)
  end


end