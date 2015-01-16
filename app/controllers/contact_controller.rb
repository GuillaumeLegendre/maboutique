class ContactController < ApplicationController
  before_filter :authenticate_user!
  def new
  end

  def create
    params[:contact][:user_id] = current_user.id
    if params[:contact][:birthday]
      params[:contact][:birthday] = Date.parse(params[:contact][:birthday])
    end
    c = Contact.create(contact_params)
    redirect_to new_contact_path, {notice: "Votre contact à bien été enregistré"}
  end

  def send_email
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :last_name, :first_name, :birthday, :phone, :vip, :user_id)
  end
end
