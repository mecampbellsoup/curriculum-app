require "./reverse_each_word"

describe String, "#reverse_each_word" do
  
  it "should reverse a single word" do
    "one".reverse_each_word.should eq("eno")
  end

  it "should reverse each individual word in a set of words" do
    "one two three".reverse_each_word.should eq("eerht owt eno")
  end

end