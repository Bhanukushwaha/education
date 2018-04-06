class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ApplicationHelper
  layout :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    resource.is_admin? ? admin_root_path : root_path
  end
  

  def authentication_admin!
    unless current_user.is_admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :password,:password_confirmation, :first_name, :last_name, :address, :is_active, :is_admin, :role)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user|
      user.permit(:email, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:email, :password,:password_confirmation, :current_password, :first_name, :last_name, :address, :is_active, :is_admin, :role)
    end
  end
end
