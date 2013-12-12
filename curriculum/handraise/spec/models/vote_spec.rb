require 'spec_helper'

describe Vote do
  let(:user){ User.create(:username => "Joe", :email => "test@gmail.com") }
  # let(:user2){ User.create(:username => "Brad", :email => "btest@gmail.com") }
  let(:issue) { user.issues.create }
  # let(:answer) { issue.answers.create }
  

  context '.ensure_not_author' do
    it "should not allow issue creator to vote on own issue" do
      expect do
        user.votes.create!(:value => -1, :issue_id => issue.id)
      end.should raise_error(ActiveRecord::RecordInvalid, /is the author of the response/)
    end

    it "should not allow an answer creator to vote on their own answer" do
      answer = user.answers.create
      answer.issue = issue
      expect do
        user.votes.create!(:value => -1, :answer_id => answer.id)
      end.should raise_error(ActiveRecord::RecordInvalid)
    end

  end
end
