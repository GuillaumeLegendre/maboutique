class ChangeDefaultDateToEndSubscriptionUser < ActiveRecord::Migration
  def change
    change_column :users, :end_subscription, :date, default: Time.new(2016)
  end
end
