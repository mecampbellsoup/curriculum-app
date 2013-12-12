class PagesController < ApplicationController
  skip_before_filter :authorize


  def home
    if current_user
      redirect_to issues_path
    end
    @organizations = Organization.all
  end
end