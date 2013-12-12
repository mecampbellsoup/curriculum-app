require 'spec_helper'

describe Group do
  it "returns a hash of groups" do 
    g = FactoryGirl.create(:group)
    u = FactoryGirl.create(:user)
    g.users << u
    g1 = FactoryGirl.create(:group)
    u1 = FactoryGirl.create(:user)
    g1.users << u1
    Group.return_groups_hash([g, g1]).should == {g.name=>[{:name=> u.name , :email=>u.email}], g1.name=> [{:name=>u1.name, :email=> u1.email}]}
   end
   it 
end
