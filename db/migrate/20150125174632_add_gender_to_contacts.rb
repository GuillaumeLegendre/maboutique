class AddGenderToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :gender, :integer, default: 0
  end
end
