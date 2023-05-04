class ApplicationController < ActionController::Base

  # サインアップ後にマイページに飛ぶ
  def after_sign_up_path_for(resource)
   customers_mypage_path(resource)
  end

  # サインイン後にマイページに飛ぶ
  def after_sign_in_path_for(resource)
   customers_mypage_path(resource)
  end
  
  # サインアウト後にホームに飛ぶ
  def after_sign_out_path_for(resource)
    root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # サインアップ時に入力する情報
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :telephone_number, :email])
  end

end
