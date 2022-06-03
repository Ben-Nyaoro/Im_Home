class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :profile_picture])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :profile_picture, :email, :password, :password_confirmation, :current_password])
	end

end
