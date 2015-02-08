class ContactController < ApplicationController
  before_filter :authenticate_user!
  before_filter :valid_subscription?, :except => :create
  layout "backoffice"

  def create
    params[:contact][:user_id] = current_user.id
    unless params[:contact][:day].empty? && params[:contact][:month].empty? && params[:contact][:year].empty?
      params[:contact][:birthday] = Date.parse( "%02d-%02d-#{params[:contact][:year]}" % [params[:contact][:day].to_i, params[:contact][:month].to_i] )
    end
    @c = Contact.create(contact_params)
    if @c.valid?
      redirect_to :back, {notice: "Votre contact à bien été enregistré."}
    else
      errors = "
      <div id='error_explanation'>
      <h2> #{ActionController::Base.helpers.pluralize(@c.errors.length, "erreur")} ont empéché ce contact d'être enregistré :</h2>
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
    if params[:template] =~ /^[0-9]+$/
      @template = current_user.templates.where(id: params[:template]).first
    end
  end

  def send_email
    @contacts = Contact.where(user_id: current_user)
    @contacts = @contacts.where(gender: Contact.genders[params[:email][:gender]]) if params[:email][:gender].present?
    @contacts = @contacts.where(vip: params[:email][:vip]) if params[:email][:vip].present?
    @contacts.each do |c|
      ContactMailer.send_to_contact(c, params[:email], current_user).deliver
    end
    redirect_to :back, {notice: "Votre email va être envoyé."}
  end

  def save_template
    params[:template][:user_id] = current_user.id

    @t = Template.create(template_params)
    if @t.valid?
      render json: true
    else
      render json: @t.errors
    end
  end

  def new_sms
  end

  def preview_number_send_sms
    @contacts = Contact.where(user_id: current_user).where.not('phone' => '')
    @contacts = @contacts.where(gender: Contact.genders[params[:gender]]) if params[:gender].present?
    @contacts = @contacts.where(vip: params[:vip]) if params[:vip].present?
    render json: @contacts.length
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :last_name, :first_name, :birthday, :phone, :vip, :user_id, :gender)
  end

  def template_params
    params.require(:template).permit(:subject, :body, :user_id)
  end

  def valid_subscription?
    if Date.today >= current_user.end_subscription
      # return redirect_to contact_payement_path, {notice: "Votre abonnement à expiré. Veuiller vous réabonner."}
    end
  end
end
