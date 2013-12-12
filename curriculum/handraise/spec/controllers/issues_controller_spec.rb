require 'spec_helper'

describe IssuesController do

  describe 'POST /issues' do
    it 'should create an issue' do
      post :create, {issue: {title:"Issue 1", description:"some text 1"}}
      assigns(:issue).should be_true
    end
  end

  describe 'updating an issue PUT /issues/:id' do
    let(:test_issue){Issue.create(:title => "Test issue", description: "some text 1")}

    it 'should update an issue' do
      put :update, {:id => test_issue.id, :issue => {description: "this has been updated"}}

      assigns(:issue).description.should == "this has been updated"
    end

    it 'should update an issues status from open to closed' do
      put :update, {:id => test_issue.id, :issue => {description: "this has been updated", status: "closed"}}

      assigns(:issue).status.should == "closed"
    end
  end
end
