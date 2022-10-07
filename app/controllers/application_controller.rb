class ApplicationController < ActionController::Base
#     before_action :authenticate_admin_user!
    before_action :authenticate_user!, except: [:admin_users]

    protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:profile_pic, :name, :email, :password,:password_confirmation,:phone_number, :remember_me)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:profile_pic, :name, :email, :password, :current_password,:phone_number,:password_confirmation, :remember_me)}
          end
    


end
