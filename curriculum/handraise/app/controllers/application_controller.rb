class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize
  helper_method :current_user
  helper_method :authorized?
  helper_method :current_org

  def sign_in(authenticated_user)
    cookies.permanent[:auth_token] = authenticated_user.auth_token
    # debugger
    @current_user = authenticated_user
  end

  def load_org
    unless current_org
      redirect_to root_url(:subdomain => 'www')
    end
  end

  def current_org
    @current_org ||= Organization.find_by_subdomain(request.subdomain) if request.subdomain
  end

  private

    def authorize
      redirect_to sign_in_url, alert: "You must be signed in for that!" unless authorized?
    end

    def authorized?
      true if current_user
    end

    def current_user
      @current_user ||= User.find_by_auth_token( cookies[:auth_token]) if cookies[:auth_token]
    end


end
