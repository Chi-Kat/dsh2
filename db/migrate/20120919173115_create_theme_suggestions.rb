class CreateThemeSuggestions < ActiveRecord::Migration
  def change
    create_table :theme_suggestions do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
