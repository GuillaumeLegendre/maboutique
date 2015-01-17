class ContactController < ApplicationController
  before_filter :authenticate_user!
  layout "backoffice"

  def create
    params[:contact][:user_id] = current_user.id
    if params[:contact][:day] && params[:contact][:month] && params[:contact][:year]
      puts params[:contact][:day] + params[:contact][:month] + params[:contact][:year].inspect
      params[:contact][:birthday] = Date.parse(params[:contact][:day] + "-" + params[:contact][:month] + "-" + params[:contact][:year] )
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
