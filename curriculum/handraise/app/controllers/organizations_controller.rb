class OrganizationsController < ApplicationController
  # before_filter :load_org
  skip_before_filter :authorize


  def index
    @organizations = Organization.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @organization = Organization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @organization = Organization.new
    # @organization.build_instructor_user

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def create
    @organization = Organization.new(params[:organization])

    respond_to do |format|
      if @organization.save
        @user = @organization.users.build(params[:user])
        if @user.save
          format.html { redirect_to root_url(subdomain: @organization.subdomain), notice: 'Organization was successfully created.' }
        else
          @organization.destroy
          format.html { render action: 'new'}
        end
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @organization = Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
    end
  end
end
