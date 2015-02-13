class AddPaypalRecurringUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paypal_recurring_uid, :string
  end
end
