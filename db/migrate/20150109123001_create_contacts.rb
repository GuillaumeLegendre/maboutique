class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email, null: false
      t.string :last_name
      t.string :first_name
      t.date :birthday
      t.string :phone
      t.boolean :vip, null: false, default: false
      t.integer :user_id
      t.timestamps
    end
  end
end
