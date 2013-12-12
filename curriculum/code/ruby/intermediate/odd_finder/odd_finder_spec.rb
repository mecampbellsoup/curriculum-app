require "./odd_finder_solution"

describe "#mark_odds" do
  
  it "should replace odd numbers with true" do
    mark_odds([3]).first.should eq(true)
  end

  it "should replace even numbers with false" do
    mark_odds([2]).first.should eq(false)
  end

end