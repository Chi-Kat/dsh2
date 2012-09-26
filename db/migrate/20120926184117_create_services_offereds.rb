class CreateServicesOffereds < ActiveRecord::Migration
  def change
    create_table :services_offereds do |t|
      t.text :current_program
      t.text :new_service
      t.integer :building_capacity
      t.boolean :kitchen

      t.timestamps
    end
  end
end
