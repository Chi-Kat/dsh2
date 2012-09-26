class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :week_day
      t.string :shift
      t.string :month_needed
      t.boolean :volunteer_age

      t.timestamps
    end
  end
end
