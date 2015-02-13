class AddPaypalRecurringPayeridToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paypal_recurring_payerid, :string
  end
end
