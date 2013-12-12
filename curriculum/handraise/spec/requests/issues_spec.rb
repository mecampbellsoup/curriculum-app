require 'spec_helper'


describe 'Issues' do
  describe 'issue creation and viewing' do
    it 'should contain proper fields' do
      visit new_issue_path

      page.should have_selector("input#issue_title")
      page.should have_selector("input#issue_description")
    end

    it 'should submit and create a issue' do
      visit new_issue_path

      fill_in "issue_title", :with => "Issue test title"
      fill_in "issue_description", :with => "This is a test"

      click_button("Issue")

      page.should have_content("Issue test title")
      page.should have_content("This is a test")
    end
  end

  describe 'issue comments' do
    let(:issue){Issue.create(:title => "Issue 1", :description => "Test description")}
    it 'should contain comment fields' do
      visit issue_path(issue)

      page.should have_selector("input#comment_content")
    end
  end

  describe "show page: GET /issues/:id" do
    let(:issue){Issue.create(:title => "Test")}

    it "displays the status of an issue" do
      visit issue_path(issue)
      page.should have_content("Status")
    end
  end

  describe "edit page: GET /issues/:id/edit" do
    let(:issue){Issue.create(:title => "Test")}

    it "displays the options for status with checkboxes" do
      visit edit_issue_path(issue)

      # save_and_open_page

      page.should have_content("Open")
      page.should have_content("Closed")
    end
  end
end
