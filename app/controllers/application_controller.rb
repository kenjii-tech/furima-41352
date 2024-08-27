class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!, except: [:index, :show] # 必要に応じて調整
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end

  def after_sign_up_path_for(resource)
    items_path
  end

  def set_current_user
    @current_user = current_user
  end
end
