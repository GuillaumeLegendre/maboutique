class ContactController < ApplicationController
  before_filter :authenticate_user!
  layout "backoffice"

  def create
    params[:contact][:user_id] = current_user.id
    unless params[:contact][:day].empty? && params[:contact][:month].empty? && params[:contact][:year].empty?
      params[:contact][:birthday] = Date.parse( "%02d-%02d-#{params[:contact][:year]}" % [params[:contact][:day].to_i, params[:contact][:month].to_i] )
    end
    @c = Contact.create(contact_params)
    if @c.valid?
      redirect_to :back, {notice: "Votre contact à bien été enregistré"}
    else
      errors = "
      <div id='error_explanation'>
      <h2> #{ActionController::Base.helpers.pluralize(3, "erreur")} ont empéché ce contact d'être enregistré :</h2>
      <ul>"
        @c.errors.full_messages.each do |msg|
          errors += "<li>#{msg}</li>"
        end
      errors += "
      </ul>
      </div>"

      redirect_to :back, notice: errors
    end
  end

  def new_email
  end

  def send_email
    @contacts = Contact.where(user_id: current_user)
    @contacts = @contacts.where(gender: Contact.genders[params[:email][:gender]]) if params[:email][:gender].present?
    @contacts = @contacts.where(vip: params[:email][:vip]) if params[:email][:vip].present?
    @contacts.each do |c|
      ContactMailer.send_to_contact(c, params[:email], current_user).deliver
    end
    redirect_to :back
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :last_name, :first_name, :birthday, :phone, :vip, :user_id, :gender)
  end
end
