class ChatsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @chats = Chat.for_user(current_user)
  end

  def show; end

  def new; end

  def create
    @chat.sender = current_user

    # Validación de receiver_id válido (por seguridad)
    unless User.exists?(id: chat_params[:receiver_id])
      flash.now[:alert] = "The selected user does not exist."
      return render :new
    end

    if @chat.save
      redirect_to chats_path, notice: 'Chat created successfully.'
    else
      flash.now[:alert] = "Failed to create chat."
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
    params.require(:chat).permit(:receiver_id)
  end
end
