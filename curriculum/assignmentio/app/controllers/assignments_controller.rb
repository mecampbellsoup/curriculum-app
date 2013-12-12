class AssignmentsController < ApplicationController
before_filter :login_required
before_filter :on_or_created_by, :only=>:show 
before_filter :user_created, :only=>[:edit,:update,:add_student,:destroy]

  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = current_user.assignments.order("due_date")
    @user = current_user
    @authored_assignments = current_user.authored_assignments.order("due_date")
    @user_assignments = UserAssignment.find_all_by_user_id(current_user)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @submissions = @assignment.all_submissions(current_user) || []
    @user_assignments = UserAssignment.find_all_by_assignment_id(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
    @assignment = Assignment.new
    respond_to do |format|  
      format.html # new.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @emails = User.all.map(&:email)  
  end
 

  def add_student
    @groups = Group.return_groups_hash(current_user.created_groups)
    @groups_list = current_user.created_groups
    @users_already_added = @assignment.users.select{|e| e. registered? }
    @users_already_invited = @assignment.users.reject { |e| e.registered?  }
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment])
    @assignment.author = current_user
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to add_student_path(@assignment), notice: 'Assignment was successfully created.' }
        #format.json { render json: edit_assignment_path(@assignment), status: :created, location: @assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @notice = 'Assignment was successfully updated.'
    if params[:checkbox] == "on"
      group = Group.create(:name=> params[:group_name])
      group.user_names = params[:assignment][:user_names]
      group.created_by = current_user
      @notice = "Assignment was successfully updated and group #{group.name} was created"
    end
    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to assignment_path(@assignment), notice: @notice }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end
  end
  ### helpers ###
  def on_or_created_by
    @assignment = Assignment.find_by_id(params[:id])
    redirect_to root_path unless @assignment.users.include?(current_user) || @assignment.author == current_user
  end
  def user_created
    @assignment = Assignment.find_by_id(params[:id])
    redirect_to root_path unless @assignment.author == current_user
  end
end
