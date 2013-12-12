class SessionsController < ApplicationController
  def new
    redirect_to_subdomain(current_user.organization.subdomain,assignments_path)  if current_user 
  end
  def create
    user = User.find_by_email(params[:email])
    if params[:forgot_password] == "1" && user
      user.new_password
      flash.now.alert = "An email has been sent to you with a new password"
      render "new"
    elsif user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      if user.registered?
        redirect_to_subdomain(user.organization.subdomain,assignments_path,:notice => "Login Sucessful!") 
      else
        redirect_to_subdomain(user.organization.subdomain,useredit_path(current_user), :notice => "Please complete your account information")
      end
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice =>"Logged Out!"
  end
end
