class MessagesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :find_user,   only: :destroy

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = "message created!"
      redirect_to current_user
    else
      flash[:error] = "message not created!"
      redirect_to current_user
    end
  end

  def destroy
    @message.destroy
    redirect_to current_user
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end

    def find_user
      @message = current_user.messages.find_by(id: params[:id])
      redirect_to root_url if @message.nil?
    end
end
