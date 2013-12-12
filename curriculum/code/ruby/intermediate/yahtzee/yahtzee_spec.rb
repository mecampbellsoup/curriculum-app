require './yahtzee'

describe Yahtzee, "#roll_dice" do

  it "should return an array" do
    Yahtzee.new.roll_dice.should be_a(Array)
  end

end

describe Yahtzee, "#win?" do

  it "should return true if all rolls are the same" do
    Yahtzee.new.win?([6,6,6,6,6,6]).should eq(true)
  end

end