class PayementController < ApplicationController
  before_filter :authenticate_user!
  layout "backoffice"

  def show
  end
end
