class AddBirthdayMailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday_mail, :boolean, default: false
  end
end
