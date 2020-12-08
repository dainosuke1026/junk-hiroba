class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @post = Post.new
  end
end
