class Users::RegistrationsController < Devise::RegistrationsController
  include Navbar

  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_action :set_minimum_password_length, only: [:new, :edit]
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]

  layout "application", only: [:edit, :update]
  layout "frontend", except: [:edit, :update]

  before_action :authenticate_user!, only: [:edit, :update]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_index_breadcrumb
    add_breadcrumb "Mi perfil", edit_user_registration_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nombre])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :nombre ])
  end

  protected

  def update_resource(resource, params)
    # Require current password if user is trying to change password.
    return super if params["password"].present?
    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
  end

  def after_inactive_sign_up_path_for(resource)
    "/login"
  end

end
