class AddImageToClassroom < ActiveRecord::Migration
  def change
  	add_column :classrooms, :image, :string
  end
end
