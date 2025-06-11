class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index; end

  def show; end

  def new; end

  def create
    if @chat.save
      redirect_to chats_path, notice: 'Chat created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @chat.update(chat_params)
      redirect_to @chat, notice: 'Chat updated successfully.'
    else
      render :edit
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:sender_id, :receiver_id)
  end
end
