require 'spec_helper'

describe Answer do
  let(:user){ User.create(:username => "Joe", :email => "test@gmail.com") }
  let(:issue) { user.issues.create }
  let(:answer) { issue.answers.create }

  context ".accepted_answer?" do
    it "should accept an answer" do
      issue.answer_id = answer.id
      issue.save
      answer.accepted_answer?.should be_true
    end

    it "should not accept an answer if false" do
      answer.accepted_answer?.should be_false
    end
  end
end
