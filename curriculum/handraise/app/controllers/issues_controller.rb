class IssuesController < ApplicationController
  before_filter :authorize
  before_filter :load_org

  def index
    @issues_search = current_org.issues.text_search(params[:query]) if params[:query]
    @issues_unresolved = current_org.issues.unresolved.newest_first
    @issues_resolved = current_org.issues.resolved.newest_first
    if current_user.is_instructor == true
      @my_issues = current_user.my_issues.sort_by{|issue|issue.created_at}.reverse
    else
      @my_issues = current_user.my_issues.newest_first
    end

    respond_to do |format|
      format.html   {
        if request.xhr?
          render :partial => 'index', :layout => false
        end
      }
    end
  end

  def show
    @issue = current_org.issues.find(params[:id])
    @answerer = Answer.find(@issue.answer_id).user if @issue.answer_id

    @comments = @issue.comments
    @answer = Answer.new

    respond_to do |format|
      format.html  { render 'index' }
      format.json { render json: @issue }
      format.js
    end
  end

  def new
    @issue = Issue.new

    respond_to do |format|
      format.html  # new.html.erb
      format.json { render json: @issue }
    end
  end

  def edit
    @issue = current_org.issues.find(params[:id])
  end

  def create
    @issue = current_org.issues.build(params[:issue])
    @issue.user = current_user

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issue_path(@issue), notice: 'Issue was successfully created.' }
        format.json { render json: @issue, status: :created, location: @issue }
      else
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @issue = current_org.issues.find(params[:id])

    respond_to do |format|
      if @issue.update_from_form(params[:issue])
        format.html { redirect_to issue_path(@issue), notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

  def vote
    vote_value = params[:vote] == 'up' ? 1 : -1

    @vote = current_user.votes.new(:value => vote_value, :issue_id => params[:id])
    @issue = Issue.find(params[:id])
    @issue.total_votes

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

  def change_status
    @issue = current_org.issues.find(params[:id])
    @issue.change_state(params["state"])
    if @issue.changed? && @issue.save
      redirect_to issue_path(@issue), notice: "Status updated!"
    else
      redirect_to issue_path(@issue), notice: "Status NOT updated."
    end
  end
end
