require 'spec_helper'

describe 'Issue' do
  let(:user){ User.create(:username => "Joe", :email => "test@gmail.com") }
  let!(:instructor){ User.create(:username => "Avi", :email => "avi@gmail.com", :is_instructor => true) }
  let(:issue){ user.issues.create }

  it 'should have default value of fresh' do
    issue.aasm_state.should == "fresh"
  end

  it "should have status change to instructor needed after 30 min" do
    issue.created_at = issue.created_at - 15.minutes
      issue.current_status.should == "opened"
  end

  it "should have status change to instructor needed after 30 min" do
    issue.created_at = issue.created_at - 45.minutes
      issue.current_status.should == "instructor_asked"
  end

  it "status should change to 'resolved' when an answer is accepted" do
    issue.answer_id = 1
    issue.accept_answer
    issue.current_status.should == "resolved"
  end

  




end
