class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter {|c| Authorization.current_user = c.current_user}
  


  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to root_path unless logged_in?
  end

  def logged_in?
    true if current_user
  end

  def user_on
    redirect_to root_path unless @assignment.users.include?(current_user)
  end

   def redirect_to_subdomain(subdomain,path,opts = {})
    redirect_to "#{request.protocol}#{subdomain}.#{request.domain}#{path}", opts
  end


  helper_method :current_user
  helper_method :logged_in?

end
