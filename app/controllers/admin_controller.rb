class AdminController < ApplicationController
  before_filter :current_user_admin?

  def contacts_user
    @users = User.all
  end

  def become_user
    sign_in(:user, User.find(params[:id]))
    redirect_to dashboard_path
  end

  private
  def current_user_admin?
    unless current_admin_user
      return redirect_to "/"
    end
  end
end
