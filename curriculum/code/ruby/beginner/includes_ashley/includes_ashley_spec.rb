require './includes_ashley'

describe Array, "#includes_ashley?" do

  it  "should return true if the array includes `ashley`" do
    ["ashley"].includes_ashley?.should eq(true)
  end

  it "should return false if the array does not include `ashley`" do
    [].includes_ashley?.should eq(false)
  end

end