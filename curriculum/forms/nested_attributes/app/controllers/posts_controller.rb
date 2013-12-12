class PostsController < ApplicationController
  def new
    @post = Post.new
    @comment = @post.comments.build
  end

  def create
  end

  def show
    @post = Post.find(params[:id])
  end
end