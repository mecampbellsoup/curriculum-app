require 'spec_helper'
require_relative 'furniture_app'

# Forms
#
# Instructions:
#
# edit chair_form.erb and create the form required as described
# in the spec below.
#
# This test will use capybara to interact with your form so
# pay attention to the names of elements described
#
# TODO: create the appropriate form in chair_form.rb
# HINT: Look at furniture_app.rb for the proper action

feature "flat forms" do
  before :all do
    Capybara.app = FurnitureApp
  end

  context "views" do
    describe "chair_form.erb" do
      it "should supply 'name' and 'description' fields to the POST chair route" do
        # Expected params hash:
        # {
        #   name: 'Barcelona Chair',
        #   description: 'foo'
        # }

        name = "Barcelona Chair"
        description = "These are large and hard to sit in."

        visit "/chair"

        fill_in "name", with: name
        fill_in "description", with: description

        click_button "Save"

        expect(page).to have_content name.upcase
        expect(page).to have_content description.upcase
      end
    end
  end
end
