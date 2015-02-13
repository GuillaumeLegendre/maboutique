class AddPaypalRecurringAccountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paypal_recurring_account, :string
  end
end
