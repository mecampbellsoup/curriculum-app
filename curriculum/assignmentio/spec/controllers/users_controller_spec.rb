require 'spec_helper'
describe UsersController do
  before :each do
    require_subdomain
  end
  # describe "get #index" do 
  #   it "populates an array of users" do

  #     org1 = FactoryGirl.create(:organization, name: 'flatiron')
  #     user1 = FactoryGirl.create(:user)
  #     # user1.organization = org1
  #     org2 = FactoryGirl.create(:organization, name: 'general assembly')
  #     user2 = FactoryGirl.create(:user)
  #     # org2.users << user2
  #     # user2.organization = org2

      
  #     current_user = user1

  #     
  #     get :index
  #     assigns(:users).should be_a_kind_of Array 
  #   end
  # end
  describe "get #show" do 
    it 'assigns requested user to @user' do
      user = FactoryGirl.create(:user)
      get :show, id: user 
      assigns(:user).should eq user 
    end
  end


  describe 'POST #create' do
    context 'with valid attributes' do
       
      it 'saves new user in database' do
        o = FactoryGirl.create(:organization)
        expect{
          binding.pry
          post :create, {:user=> {:name=>"James",
                                 :email=>"james25@james.com",
                                 :password=>"soup",
                                 }, :organization => o.name}
          }.to change(User, :count).by(1)
      end

      it 'redirects to assignments_path' do 
        
        post :create, user: FactoryGirl.attributes_for(:user)
        
        response.should redirect_to assignments_path
      end
    end

    context 'with invalid attributes' do
      it 'saves new user in database' do
        expect{
          post :create, user: FactoryGirl.attributes_for(:invalid_user)
          }.to_not change(User, :count)
      end

      it 're-renders the :new template' do
        post :create,
            user: FactoryGirl.attributes_for(:invalid_user)
          response.should render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do 
      @user = FactoryGirl.create(:user)
    end

    it 'locates the requested @user' do
      put :update, id: @user, user: FactoryGirl.attributes_for(:user)
      assigns(:user).should eq(@user)
    end

    context 'valid attributes' do
      it 'changes @user attributes' do 
        put :update, id: @user,
          user: FactoryGirl.attributes_for(:user, name: "Kevin")
          @user.reload
          @user.name.should eq("Kevin")
      end

      it 'redirect to the updated user' do
        put :update, id: @user, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to assignments_path
      end
    end

    context 'invalid attributes' do 

      it "does not change users's attributes" do 
        put :update, id: @user,
        user: FactoryGirl.attributes_for(:invalid_user,
        name: "None of your business",
        email: nil)
        @user.reload
        @user.name.should_not eq("None of your business")
      end
      it "re-renders the edit method" do
        put :update, id: @user,
        user: FactoryGirl.attributes_for(:invalid_user,
        name: "None of your business",
        email: nil)
        
        response.should redirect_to useredit_path(@user) 
      end
    end

  end

end


