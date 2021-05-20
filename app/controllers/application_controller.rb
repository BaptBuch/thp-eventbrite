class ApplicationController < ActionController::Base

  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :description, :avatar)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :description, :current_password, :avatar)}
  end  

  # def configure_devise_parameters
  #   devise_parameter_sanitizer.permit(:update) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :description)}
  # end  

end
