class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  #--------Redirect to user path after sign in----------#
  def after_sign_in_path_for(resource)
    resource
  end

  def configure_permitted_parameters #--- for permitting signup parameters ---#
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :role, :name) }
  end
end
