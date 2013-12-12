require './count_sentences'

describe String, "#count_sentences" do

  it  "should return the number of sentences in a string" do
    "one. two. three?".count_sentences.should eq(3)
  end

  it "should return zero if there are no sentences in a string" do
    "".count_sentences.should eq(0)
  end

end