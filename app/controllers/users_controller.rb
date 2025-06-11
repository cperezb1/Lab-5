class UsersController < ApplicationController
  # Solo pide autenticación para acciones privadas
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  
  # Carga el recurso User y verifica permisos con CanCanCan
  load_and_authorize_resource

  def index
    # @users es manejado automáticamente por CanCanCan
  end

  def show
    # @user también es cargado automáticamente
  end

  def new
    # @user = User.new ya está hecho por CanCanCan
  end

  def create
    if @user.save
      redirect_to users_path, notice: 'User created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User deleted successfully."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
