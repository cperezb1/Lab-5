class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat
  load_and_authorize_resource through: :chat

  def create
    @message.user = current_user
    if @message.save
      redirect_to chat_path(@chat), notice: 'Message sent successfully.'
    else
      render 'chats/show'
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end

end
