class SessionsController < ApplicationController
  skip_before_filter :login_required, :only => [:new, :create]
  
  def new
  end

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    user.associate_with_existing_projects
    RepoScraper.new(user)
    session[:user_id] = user.id
    if user.created_at > (Time.now - 30.seconds)
      redirect_to edit_user_path(user), notice: "You have successfully been signed up! Please confirm your information before continuing."
    else
      redirect_to user, notice: "Signed in!"
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Signed out!"
  end
end
