class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper
  layout "backoffice", only: [:edit, :update]

  def create
    super
  end

  def new
    super
  end

  def update
    super
  end

  def edit
    render :edit
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end


  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :phone)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :phone, :last_name, :first_name, :name_pro, :address, :zip_code, :town)
  end

  # The default url to be used after updating a resource. You need to overwrite
  # this method in your own RegistrationsController.
  def after_update_path_for(resource)
    edit_user_registration_path
  end
end
