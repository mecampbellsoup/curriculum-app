class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :login_required

  def home
    render :text => "You are logged in as #{User.find(session[:user_id]).email}"
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def login_required
    redirect_to root_path, :notice => "You must be logged in!" if !logged_in?
  end

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def can_current_user?(action, object)
    if !object.send("#{action}able_by?", current_user)
      redirect_to user_path(current_user), :notice => "You are not authorized" and return
    else
      true
    end
  end
end
