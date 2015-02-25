class CreateDefaultTemplates < ActiveRecord::Migration
  def change
    create_table :default_templates do |t|
      t.string :name
      t.string :subject
      t.text :body
      t.string :img
    end
  end
end
