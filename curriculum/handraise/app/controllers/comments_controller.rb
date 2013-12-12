class CommentsController < ApplicationController

  def index
    @commentable = find_commentable
    @comments = @commentable.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @commentable = find_commentable 

    # @comment = current_user.comments.build(params[:comment])
    #@comment.issue_id = params[:issue_id]
    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        Notifier.comment_mail(@commentable, @commentable.user, @comment.user, @comment).deliver
        format.html { redirect_to comment_redirect(@commentable), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  def vote
    # raise params.inspect
    vote_value = params[:vote] == 'up' ? 1 : -1
    @vote = current_user.votes.new(:value => vote_value, :comment_id => params[:id])
    if @vote.save
      respond_to do |f|
        f.html {redirect_to :back, notice: "Thank you for voting"}
        f.js {}
      end
    else
      # format.json { render json: vote.errors, status: :unprocessable_entity }
      # flash[:notice] = "Messages"
      # debugger
      # flash[:notice] = {level: :error, message: @vote.errors.full_messages.to_sentence}
      flash.now[:error] = @vote.errors.full_messages.to_sentence

      respond_to do |f|
        f.html {redirect_to :back}
        f.js {}
      end
    end
  end

  private

  def comment_redirect(commentable)
    if commentable.respond_to?(:issue)
      issue_path(commentable.issue)
    else
      issue_path(commentable)
    end
  end

  def find_commentable
    if params[:answer_id]
      @commentable = Answer.find(params[:answer_id])
    elsif params[:issue_id]
      @commentable = Issue.find(params[:issue_id])
    end
  end

end
