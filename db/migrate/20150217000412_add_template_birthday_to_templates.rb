class AddTemplateBirthdayToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :birthday, :boolean, default: false
  end
end
