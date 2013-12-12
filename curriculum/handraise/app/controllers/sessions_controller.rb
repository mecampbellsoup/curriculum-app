class SessionsController < ApplicationController
  skip_before_filter :authorize, :only => [:new, :create, :destroy]

  def new
    # raise current_org.inspect

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      cookies.permanent[:auth_token] = user.auth_token
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to "/sign_in", :notice => "Signed out!"
  end

end

