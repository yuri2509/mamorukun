class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == GUEST_ACCOUNT::GUEST_EMAIL
      redirect_to root_path, alert: 'ゲストユーザーの編集・削除はできません。'
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
