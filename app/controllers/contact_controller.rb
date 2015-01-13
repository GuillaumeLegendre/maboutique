class ContactController < ApplicationController
  def new
  end

  def create
    redirect_to new_contact_path, {notice: "Votre contact à bien été enregistré"}
  end

  def send_email
  end
end
