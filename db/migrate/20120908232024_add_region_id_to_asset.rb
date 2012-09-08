class AddRegionIdToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :region_id, :integer
  end
end
