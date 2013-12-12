class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
    if @user.update_attributes(params[:user])
        format.html { redirect_to assignments_path, :notice => "Your settings have been saved."}
      else
        format.html { redirect_to useredit_path(@user), :notice => "nope, try again!"}
      end
    end
  end
  
  def index
    @users = Organization.find(current_user.organization).users.registered.where("LOWER(name) LIKE ? OR LOWER(email) LIKE ?","%#{params[:q]}%","%#{params[:q]}%")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @users.as_json(:only => [:name, :id, :email]) }
    end
  end

  def new
    @user = User.new
    @subdomain = params[:org] if params[:org]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user].except(:organization))
    @user.organization = Organization.create(params[:user][:organization])
    @user.authentication_token = User.create_authentication_token
    respond_to do |format|
      if @user.organization.persisted? && @user.save
        UserMailer.registration_confirmation(@user).deliver
        session[:user_id] = @user.id
        format.html { redirect_to_subdomain(@user.organization.subdomain, assignments_path, :notice => "Signed up!")}
      else
        format.html { redirect_to signup_path, :notice =>"Error Signing up, please try again" }
      end
    end
  end
end
