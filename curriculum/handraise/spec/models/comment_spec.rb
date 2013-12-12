require 'spec_helper'


describe Comment do
  it "is able to comment on an issue" do
    issue = Issue.create(:title => "Why won't Joe let up?")
    issue.comments.create(:content => "Test")
  
    issue.comments.first.content.should == "Test"
  end
end


