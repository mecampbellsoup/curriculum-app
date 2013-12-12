require './block_solution'

describe "#test" do
  it "should not blow up" do
    call_block {"hello"}.should eq("hello")
  end

  it "should not blow up" do
    yield_block {"hello"}.should eq("hello")
  end
end