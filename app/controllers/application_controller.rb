class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper
  layout :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :resource_name, :resource, :devise_mapping, :resource_class, :after_sign_in_path_for
  
  def after_sign_in_path_for(resource)
    resource.is_admin? ? admin_root_path : root_path
  end
  

  def authenticate_admin!
    if is_namespace_admin
      return redirect_to root_path, alert: "Unauthorized Access" if (!(current_user && current_user.is_admin?))
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email, :password,:password_confirmation, :username, :first_name, :last_name, :address, :is_active, :is_admin, :role, :image, :state, :city, :student_id, :phone, :country, :Date_of_birth, :status, :latitude, :longitude)
    end
    devise_parameter_sanitizer.permit(:sign_in) do |user|
      user.permit(:email, :password, :username)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:email, :password,:password_confirmation, :current_password, :username, :first_name, :last_name, :address, :is_active, :is_admin, :role, :image, :state, :city, :student_id, :phone, :country, :Date_of_birth, :status, :latitude, :longitude)
    end
  end
end
