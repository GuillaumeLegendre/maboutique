class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  def create
    super
  end

  def new
    super
  end

  def edit
    render :edit, layout: "backoffice"
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :phone)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :phone)
  end
end
