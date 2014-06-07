class CommentsController < ApplicationController
  before_action :signed_in_user

  def create
    @message = Message.find(params[:message_id])
    @comment = @message.comments.create(
      content: params[:comment][:content],
      user_id: current_user.id
    )
    
    if @comment.save
      flash[:success] = "comment created!"
    else
      flash[:error] = "comment not created!"
    end
    redirect_to @message
  end
end