class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'furima_admin'
    end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:password])
  end
end