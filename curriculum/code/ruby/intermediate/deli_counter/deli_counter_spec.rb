require './deli_counter'

describe Deli, "#line" do
  let(:deli) { Deli.new(["1. Ashley", "2. Steve"]) }

  it  "should return an Array" do
    deli.line.should be_a(Array)
  end

    it  "should return the arguments Array" do
    deli.line.should eq(["1. Ashley", "2. Steve"])
  end

end

describe Deli, "#take_a_number" do
  let(:deli) { Deli.new }

  it  "return a Integer" do
    deli.take_a_number("Ashley").should be_a_kind_of(Integer)
  end

  it  "return the next place in line" do
    deli.take_a_number("Ashley").should eq(1)
  end

  it  "add an element the line" do
    deli.take_a_number("Ashley")
    deli.line.length.should eq(1)
  end

  it  "update the line" do
    deli.take_a_number("Ashley")
    deli.line.first.should eq("1. Ashley")
  end
end

describe Deli, "#now_serving" do
  let(:deli) { Deli.new(["1. Ashley", "2. Steve"]) }

  it  "should return the first person in line" do
    deli.now_serving.should eq("1. Ashley")
  end

  it "should update the line" do
    deli.now_serving
    deli.line.should eq(["2. Steve"])
  end

end