class TopController < ApplicationController
  def index
    @posts = Post.includes(:post_users).order('created_at DESC')
  end
end
