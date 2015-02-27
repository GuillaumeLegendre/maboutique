class AddUnsuscribeEmailToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :unsuscribe_email, :boolean, default: false
  end
end
