class AddDateEndSubscriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :end_subscription, :date, default: Time.new(2000)
  end
end
