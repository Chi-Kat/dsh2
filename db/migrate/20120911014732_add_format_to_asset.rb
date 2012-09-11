class AddFormatToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :format, :string
  end
end
