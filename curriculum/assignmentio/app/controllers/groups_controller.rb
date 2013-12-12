class GroupsController < ApplicationController
before_filter :login_required
  # GET /groups
  # GET /groups.json
  def index
    @groups = current_user.groups 
    @created_groups = current_user.created_groups
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @students = @group.users

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new
    @groups = Group.return_groups_hash(current_user.created_groups)
    @groups_list = current_user.created_groups
    @users_already_added = @group.users.select{ |e| e.registered?}
    @users_already_invited = @group.users.reject{ |e| e.registered?}
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
    @groups = Group.return_groups_hash(current_user.created_groups)
    @groups_list = current_user.created_groups
    @users_already_added = @group.users.select{ |e| e.registered?}
    @users_already_invited = @group.users.reject{ |e| e.registered?}
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(name:params[:group][:name])
    @group.created_by  = current_user
    respond_to do |format|
      if @group.save
        @group.user_names = (params[:group][:user_names])
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group= Group.find_by_id(params[:id])
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

end
