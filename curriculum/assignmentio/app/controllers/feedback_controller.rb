class FeedbackController < ApplicationController
  before_filter :login_required
  before_filter :assigned_to_or_created_by, :only=> :show
  
  def assigned_to_or_created_by
    @submission = Submission.find(params[:submission_id])
    redirect_to root_path unless @submission.user_assignment.user == current_user || @submission.assignment.author == current_user
  end

  def new
    
  end

  def create
    @submission = Submission.find_by_id(params[:submission_id])
    @submission.feedback = params[:submission][:feedback]
    @submission.user_assignment.status = "Graded"
    @submission.user_assignment.save
    respond_to do |format|
      if @submission.save
	     format.html { redirect_to assignment_path(@submission.user_assignment.assignment), notice: 'Feedback was successfully given.' }
	     format.json { render json: @submission.user_assignment.assignment, status: :created, location: @submission.user_assignment.assignment }
      else
      	format.html { render action: "new" }
      	format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    
  end

  def update
    
    @submission.user_assignment.status = "Graded"
  end

  def edit
    
    respond_to do |format|
      if @submission.update_attributes(params[:Submission])
	format.html { redirect_to assignment_path(params[:assignment_id]), notice: 'Submission was successfully created.' }
	format.json { render json: @submission, status: :created, location: @submission }
      else
	format.html { render action: "new" }
	format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
  end
end
