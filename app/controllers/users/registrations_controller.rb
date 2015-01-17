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
end
