require 'spec_helper'

describe Assignment do 
  it "has a valid factory" do
    expect(FactoryGirl.create(:assignment)).to be_valid
  end

  describe "validations" do
    it "is invalid without a name" do
      expect(FactoryGirl.build(:assignment, :name => nil)).to_not be_valid
    end

    it "is invalid without content" do
      expect(FactoryGirl.build(:assignment, :content => nil)).to_not be_valid
    end
  end

  describe "returns a user's status" do
    it "returns incomplete for a incomplete assignment" do 
      @user = FactoryGirl.create(:user)
      @assignment = FactoryGirl.create(:assignment, :incomplete_assignment, :user => @user)
      expect(@assignment.status(@user)).to eq "Incomplete"
    end

    it "returns submitted for a submitted assignment" do
      @user = FactoryGirl.create(:user)
      @assignment = FactoryGirl.create(:assignment, :submitted_assignment, :user => @user)
      expect(@assignment.status(@user)).to eq "Submitted"
    end

    it "returns graded for a graded assignment" do 
      @user = FactoryGirl.create(:user)
      @assignment = FactoryGirl.create(:assignment, :graded_assignment, :user => @user)
      expect(@assignment.status(@user)).to eq "Graded"    
    end
  end

  describe "manage users on assignment" do
    it "can add users by name or email" do
      assignment = FactoryGirl.create(:assignment)
      user = FactoryGirl.create(:user)
      assignment.user_names = "testass@test.com, #{user.name}"
      expect(assignment.users.count).to eq 2
    end

    it "can remove users" do
      user = FactoryGirl.create(:user)
      assignment = FactoryGirl.create(:assignment, :incomplete_assignment, :user => user)

      expect(assignment.users.count).to eq 1
      assignment.remove_users([user])
      expect(assignment.users.count).to eq 0
    end
  end
end
