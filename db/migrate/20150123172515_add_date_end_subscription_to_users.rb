class AddDateEndSubscriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :end_subscription, :date, default: Time.new(2014)
  end
end
