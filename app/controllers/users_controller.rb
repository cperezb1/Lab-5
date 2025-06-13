class UsersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    redirect_to chats_path, alert: "Access denied."
  end

  def show
    redirect_to chats_path, alert: "Access denied." unless @user == current_user
  end

  def new
    redirect_to chats_path, alert: "Access denied."
  end

  def create
    redirect_to chats_path, alert: "Access denied."
  end

  def edit
    redirect_to chats_path, alert: "Access denied." unless @user == current_user
  end

  def update
    if @user == current_user
      if @user.update(user_params)
        redirect_to @user, notice: 'Profile updated successfully.'
      else
        render :edit
      end
    else
      redirect_to chats_path, alert: "Access denied."
    end
  end

  def destroy
    redirect_to chats_path, alert: "Access denied."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
