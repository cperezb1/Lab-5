class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index; end

  def show; end

  def new; end

  def create
    if @message.save
      redirect_to messages_path, notice: 'Message sent successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @message.update(message_params)
      redirect_to @message, notice: 'Message updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to messages_path, notice: 'Message deleted successfully.'
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id, :user_id)
  end
end
