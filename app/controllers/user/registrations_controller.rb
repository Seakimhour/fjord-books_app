# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_params_permit

  protected

  def configure_params_permit
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[postal_code address self_introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[postal_code address self_introduction])
  end
end
