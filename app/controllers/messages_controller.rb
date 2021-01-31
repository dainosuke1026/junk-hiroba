class MessagesController < ApplicationController
  def index
    @message = Message.new
    @post = Post.find(params[:post_id])
    @messages = @post.messages.includes(:user)
    #@post.messages (アソシエーションが組まれているため、@post.messagesとすることで@postに投稿されたmessageをすべて取得できる)
  end
  
  def create
    # binding.pry
    @post = Post.find(params[:post_id])
    message = @post.messages.create(message_params)
    render json:{ message: message }
    # if @message.save
    #   redirect_to post_messages_path(@post)
    # else
    #   @messages = @post.messages.includes(:user)
    #   render :index
    # end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
