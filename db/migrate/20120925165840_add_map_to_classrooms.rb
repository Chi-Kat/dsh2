class AddMapToClassrooms < ActiveRecord::Migration
  def change
  	add_column :classrooms, :map, :string
  end
end
