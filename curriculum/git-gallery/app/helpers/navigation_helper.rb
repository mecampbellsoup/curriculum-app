module NavigationHelper
  def sign_up
	  link_to "Sign Up", new_user_path if !logged_in?
	end

  def current_user
   return current_user
  end
end