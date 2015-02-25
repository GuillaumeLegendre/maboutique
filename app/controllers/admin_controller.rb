class AdminController < ApplicationController
  before_filter :current_user_admin?

  def contacts_user
    @users = User.all
  end

  private
  def current_user_admin?
    unless current_admin_user
      return redirect_to "/"
    end
  end
end
