require 'spec_helper'

describe 'Users' do
  describe 'user signup/creation' do
    it 'provide a user signup page that accepts a username' do
      visit sign_up_path
      page.should have_selector("input#user_username")
    end

    it 'should allow a new user to signup by providing a username' do
      visit new_user_path

      fill_in "user_username", with: "rando"
      click_button("User")

      page.should have_content("rando")
    end
  end


  describe 'user signin' do
      
    it 'should provide a user signin page that accepts a username' do
      visit sign_in_path
      page.should have_selector("input#username")
    end

    it 'should allow a user to signin with a username' do
      User.create(username:"rando")

      visit sign_in_path

      fill_in "username", with: "rando"
      click_button("sign in")

      page.should have_content("Signed in!")
    end
  end
end