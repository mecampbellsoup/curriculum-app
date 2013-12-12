require File.dirname(__FILE__) + '/../spec_helper'

describe User do

  it "has a valid factory" do 
    FactoryGirl.create(:user).should be_valid
  end

  it "is invalid without a email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it 'can register' do 
    fg = FactoryGirl.build(:user)
    fg.register.should be_true
  end

  it 'can not register without a name' do
    fg = FactoryGirl.build(:user, name: nil, email: "test@test.com")
    fg.register.should_not be_true
  end

  it 'is registered' do 
    fg = FactoryGirl.create(:user)
    fg.registered = true
    User.registered.should include(fg)
  end

  it 'is invited' do 
    fg = FactoryGirl.create(:user, name: nil)
    fg.registered = false
    User.invited.should include(fg)
  end

  it 'is assigned by me' do 
    author = FactoryGirl.create(:user)
    assignment = FactoryGirl.create(:assignment)
    assignment.author = author
    author.assigned_by_me?(assignment).should be_true
  end

  it "can set a status" do 
    ua = FactoryGirl.create(:user_assignment)
    a = FactoryGirl.create(:assignment)
    u = FactoryGirl.create(:user)
    ua.user = u
    ua.assignment = a 
    u.set_status(a, "completed")
    ua.status.should == "completed"
  end

  it 'returns and array of all assignments and their status' do
    ua = FactoryGirl.create(:user_assignment)
    ua2 = FactoryGirl.create(:user_assignment)
    a = FactoryGirl.create(:assignment)
    a1 = FactoryGirl.create(:assignment)
    fg = FactoryGirl.create(:user)
    ua.user = fg 
    ua.assignment = a 
    ua2.user = fg
    ua2.assignment = a1
    ua.save
    ua2.save
    fg.all_assignments_and_status.length.should be 2
  end


  describe "email invite" do 
    it "fits responds to invitation" do

      fg = FactoryGirl.create(:user)
      UserMailer.should_receive(:invitation).
        with(fg).
        and_return(Mail::Message
.new(:to => fg.email, :from => "services@flatironschool.com"))
      fg.email_invite
    end



    it "returns a UserMailer Object" do 
      fg = FactoryGirl.create(:user)
      fg.email_invite.should be_a_kind_of Mail::Message

    end
  end
end