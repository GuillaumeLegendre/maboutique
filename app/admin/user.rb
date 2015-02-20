ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :last_name, :first_name, :name_pro, :phone, :address, :zip_code, :town, :credits, "end_subscription(1i)", "end_subscription(2i)", "end_subscription(3i)", "paypal_recurring_account", "paypal_recurring_uid", "paypal_recurring_token", "paypal_recurring_payerid"


end
