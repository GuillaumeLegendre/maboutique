class AddActivateToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :activate, :boolean, default: true
  end
end
