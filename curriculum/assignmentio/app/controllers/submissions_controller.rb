class SubmissionsController < ApplicationController
  before_filter :login_required
  before_filter :assigned_to_or_created_by, :only=> :show

  def assigned_to_or_created_by
    @submission = Submission.find(params[:id])
    redirect_to root_path unless @submission.user_assignment.user == current_user || @submission.assignment.author == current_user
  end

  def index
    @user_assignments = UserAssignment.find_all_by_assignment_id(params[:assignment_id]).sort{ |a, b| b.status<=>a.status}
    @assignment = Assignment.find_by_id(params[:assignment_id])
    #submissions = @user_assignments.submissions
    # @submission = UserAssignment.find(@user, @assignment).submission
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @submissions }
    end
  end

  def download_all_submissions
    @submissions = UserAssignment.find_all_by_assignment_id(params[:assignment_id]).collect{|ua| ua.submission}.compact
    redirect_to Submission.zip_files(@submissions).split("public").last
  end

  # GET /Submissions/1
  # GET /Submissions/1.json
  def show  

    @user = Submission.find(params[:id]).user_assignment.user
    @assignment = Submission.find(params[:id]).user_assignment.assignment 
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @submission }
    end
  end

  # GET /Submissions/new
  # GET /Submissions/new.json
  def new
    @submission = Submission.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @submission }
    end
  end

  # GET /Submissions/1/edit
  def edit
    
  end

  # POST /Submissions
  # POST /Submissions.json
  def create
    @submission = Submission.new(params[:submission])   
    @submission.user_assignment = UserAssignment.find_by_user_id_and_assignment_id(current_user.id, params[:assignment_id])
    

    respond_to do |format|
      if @submission.save
        format.html { redirect_to assignments_path, notice: 'Submission was successfully created.' }
        @submission.add_to_assignment(current_user,params[:assignment_id])
        UserMailer.submittal_notification(@submission.user_assignment.user, @submission.user_assignment.assignment).deliver
        format.json { render json: @submission, status: :created, location: @submission }
      else
        format.html { render action: "new" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Submissions/1
  # PUT /Submissions/1.json
  def update
    
    @submission.user_assignment_id = UserAssignment.find_by_user_id_and_assignment_id(current_user.id, params[:assignment_id]).id
    respond_to do |format|
      if @submission.update_attributes(params[:Submission])
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Submissions/1
  # DELETE /Submissions/1.json
  def destroy
    
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to Submissions_url }
      format.json { head :no_content }
    end
  end

end
