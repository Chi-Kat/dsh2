class AddImageToUserRegion < ActiveRecord::Migration
  def change
  	add_column :regions, :image, :string
  	add_column :regions, :description, :text
  end
end
