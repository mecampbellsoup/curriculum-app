class UserAssignmentsController < ApplicationController
  #get /users/:user_id/assignments/:assign_id
  def edit
    # raise params.inspect
    @user_assignment = UserAssignment.find_by_user_id_and_assignment_id(params["user_id"],params["assign_id"])
  end
  def update
    
    @user_assignment = UserAssignment.find_by_user_id_and_assignment_id(params["user_id"],params["assign_id"])
    if @user_assignment.update_attributes(params[:user_assignment])
      format.html { redirect_to @user, notice: 'Assignment was successfully updated.' }
    end
  end
  def index 
    @user_assignment = UserAssignment.find(params[:id])
    @user = @user_assignment.user
    @submission = @user_assignment.submission

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_assignment }
    end
  end

  def reminder
    @user_assignment = UserAssignment.find(params[:id])
    UserMailer.reminder(@user_assignment.user, @user_assignment.assignment).deliver
    respond_to do |format|
      # format.html{redirect_to assignment_submissions_path(@user_assignment), notice: 'reminder sent!'} 
      format.js {}
    end
  end



end
