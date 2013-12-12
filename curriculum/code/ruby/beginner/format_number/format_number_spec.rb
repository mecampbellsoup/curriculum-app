require './format_number'

describe Integer, "#format" do

  it "should return a string with a comma every 3 char starting from the right for 4 digit numbers" do
    1000.format.should eq("1,000")
  end

  it "should return a string with a comma every 3 char starting from the right for 4+ digit numbers " do
    1000000.format.should eq("1,000,000")
  end

  it "should return a string with no commas if the number is < 4 char" do
    100.format.should eq("100")
  end
end