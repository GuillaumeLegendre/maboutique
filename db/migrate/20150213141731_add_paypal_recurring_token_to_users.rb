class AddPaypalRecurringTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paypal_recurring_token, :string
  end
end
