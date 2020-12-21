class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:name, user_ids:[])
  end
end
