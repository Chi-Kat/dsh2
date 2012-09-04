class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :classroom_id
      t.integer :theme_id
      t.integer :user_id
      t.string :youtube_url
      t.string :contributors
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
