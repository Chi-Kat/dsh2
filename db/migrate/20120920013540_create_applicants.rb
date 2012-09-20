class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email
      t.string :classroom
      t.integer :region_id
      t.text :note

      t.timestamps
    end
  end
end
