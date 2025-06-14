class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  # Redirigir correctamente tras cerrar sesión
  def after_sign_out_path_for(resource_or_scope)
    unauthenticated_root_path
  end
end
