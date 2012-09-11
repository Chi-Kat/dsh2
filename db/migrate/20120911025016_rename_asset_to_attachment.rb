class RenameAssetToAttachment < ActiveRecord::Migration
 def change
 	rename_table :assets, :attachments
 end 
end
