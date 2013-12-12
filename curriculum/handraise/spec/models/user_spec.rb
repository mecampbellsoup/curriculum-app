require 'spec_helper'

describe User do
  describe 'user signup' do

    it 'creating a new user should require a username' do
      user = User.create
      User.all.count.should == 0
    end

  end
end
