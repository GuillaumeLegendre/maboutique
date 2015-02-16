ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :last_name, :first_name, :name_pro, :phone, :address, :zip_code, :town, :credits, "encrypted_password", "reset_password_token", "reset_password_sent_at(1i)", "reset_password_sent_at(2i)", "reset_password_sent_at(3i)", "reset_password_sent_at(4i)", "reset_password_sent_at(5i)", "remember_created_at(1i)", "remember_created_at(2i)", "remember_created_at(3i)", "remember_created_at(4i)", "remember_created_at(5i)", "current_sign_in_at(1i)", "current_sign_in_at(2i)", "current_sign_in_at(3i)", "current_sign_in_at(4i)", "current_sign_in_at(5i)", "last_sign_in_at(1i)", "last_sign_in_at(2i)", "last_sign_in_at(3i)", "last_sign_in_at(4i)", "last_sign_in_at(5i)", "current_sign_in_ip", "last_sign_in_ip", "end_subscription(1i)", "end_subscription(2i)", "end_subscription(3i)", "paypal_recurring_account", "paypal_recurring_uid", "paypal_recurring_token", "paypal_recurring_payerid"


end
