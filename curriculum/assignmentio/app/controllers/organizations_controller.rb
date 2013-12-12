class OrganizationsController < ApplicationController
  def new
      @organization = Organization.new
      respond_to do |format|
        format.html # new.html.erb
      end
  end
  def create
      @organization = Organization.new(params[:organization])
      respond_to do |format|
        if @organization.save
          format.html { redirect_to signup_path(:org=>@organization.subdomain), notice: 'Organization successfully created. Please create your account.' }      
        else
          format.html { render action: "new" }
        end
      end
  end
  def landing_page
    redirect_to_subdomain(current_user.organization.subdomain,assignments_path) if current_user
  end
  def edit
  end
  def update
    current_user.organization.invite_by_email(params[:emails])
    redirect_to assignments_path, notice: "Invites sent"
  end
end
