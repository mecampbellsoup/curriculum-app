class AnswersController < ApplicationController

  def edit
    @answer = Answer.find(params[:id])
    @issue = current_org.issues.find(params[:issue_id])
  end

  def create
    debugger
    @issue = current_org.issues.find(params[:issue_id])
    @answer = @issue.answers.build(params[:answer])
    @answer.user = current_user
    @issue_creator = @issue.user

    respond_to do |format|
      if @answer.save
        Notifier.notice_mail(@issue, @issue_creator, @answer.user).deliver
        format.html { redirect_to issue_path(@issue), notice: 'Answer was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote
    vote_value = params[:vote] == 'up' ? 1 : -1

    @vote = current_user.votes.new(:value => vote_value, :answer_id => params[:id])
    @answer = Answer.find(params[:id])
    @answer.total_votes
    
    if @vote.save
      respond_to do |f|
        f.html {redirect_to :back, notice: "Thank you for voting"}
        f.js {}
      end
    else
      flash.now[:error] = @vote.errors.full_messages.to_sentence

      respond_to do |f|
        f.html {redirect_to :back}
        f.js {}
      end
    end
  end

  def update
    @answer = Answer.find(params[:id])

    respond_to do |format|
      if @answer.update_attributes(params[:answer])
        format.html { redirect_to issue_path(@answer.issue), notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end


end
