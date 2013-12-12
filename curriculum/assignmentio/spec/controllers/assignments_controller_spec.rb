require 'spec_helper'

describe AssignmentsController do
  before :each do
    @user = FactoryGirl.create(:user)
    session[:user_id] = @user.id
  end
  
  describe 'GET #index' do 
    it "populates an array of assignments" do 
      # assignment = FactoryGirl.create(:assignment)
      get :index
      # assigns(:assignments).should eq [assignment]
    end
    it "renders the :index view"
  end

  describe 'GET #new' do
    it "assigns a new Assignment to @assignment" do
      get :new
      assigns(:assignment).should be_a_new(Assignment)
    end

    it "renders the :new template" do
      get :new, :format => "html"
      response.should render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns all user emails to @emails"
    it "renders the :edit template"
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new message in the database"
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the new message in the database"
      it "re-renders the :new template"
    end
  end

  describe 'PUT #update' do
    context "with valid attributes" do 
      it "updates the message in the database"
      it "redirects to the message"
    end

    context "with invalid attributes" do
      it "does not update the message"
      it "re-renders the #edit template"
    end
  end

  describe 'DELETE #destroy' do
    it "deletes the message from the database"
    it "redirects to the homepage"
  end
end