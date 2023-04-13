class ApplicationController < ActionController::Base
  
  def after_sign_up_path_for(resource)
   customers_mypage_path(resource)
  end
  
  def after_sign_in_path_for(resource)
   customers_mypage_path(resource)
  end
  
  before_action :set_search
  
  def set_search
   @search = Genre.ransack(params[:q])
   @search_menus = @search.result
  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :address, :telephone_number, :email])
  end
    
end
