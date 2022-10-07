# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up

  # def new

  #   super
  # end

  # POST /resource
  # def create
  #   # @user=User.new
  #   # @user = User.new(params[:email])
  #   # if @user.save
  #   #   UserMailer.signed_up(@user).deliver_now
  #   # end
  #   super
  #   # @user = User.new(user_params)
  #   # UserMailer.signed_up(@user).deliver_now
  #   # AdminMailer.new_user_waiting(@user).deliver_now
  #   # redirect_to new_user_session_path
  # end

  # # GET /resource/edit
  # def edit
  #   super
  # end

  # # PUT /resource
  # def update
  #   super
  # end

  # # DELETE /resource
  # def destroy
  #   super
  # end

  def after_sign_up_path_for(resource)
    if current_user.pending?
      flash[:alert]="wait you are in pendding list"
      destroy_user_session_path
    else
      super
    end
    # redirect_to new_user_session_path
  end

  # # GET /resource/cancel
  # # Forces the session data which is usually expired after sign
  # # in to be expired now. This is useful if the user wants to
  # # cancel oauth signing in/up in the middle of the process,
  # # removing all OAuth session data.
  # # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  #   new_user_session_path
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  # def user_params
  #   params.require(:user).permit(:profile_pic,:name,:email, :password, :password_confirmation, :phone_number, :status)
  # end
end
