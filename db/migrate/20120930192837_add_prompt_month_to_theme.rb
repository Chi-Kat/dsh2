class AddPromptMonthToTheme < ActiveRecord::Migration
  def change
  	add_column :themes, :prompt, :string
  	add_column :themes, :current_theme, :boolean
  end
end
