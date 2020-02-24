class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception 
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :avatar])
  end

  def after_sign_out_path_for(devise)
		root_path
	end

end