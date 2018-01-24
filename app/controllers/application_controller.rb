class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permit, if: :devise_controller?

  protected

  def configure_permit
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
