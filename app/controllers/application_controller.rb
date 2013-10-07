class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.for(:account_update) << :image
#     devise_parameter_sanitizer.for(:account_update) << :username
#   end
# end



#  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, 
        :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :image,
        :email, :password, :password_confirmation, :current_password)
    end
  end
end