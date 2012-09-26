class CreateClientTypes < ActiveRecord::Migration
  def change
    create_table :client_types do |t|
      t.boolean :children
      t.integer :num_child
      t.boolean :adult
      t.integer :num_adult
      t.boolean :LGBTQ
      t.string :num_
      t.integer :LGBTQ
      t.boolean :young_adult
      t.integer :num_young_adult
      t.boolean :senior
      t.integer :num_senior
      t.boolean :immigrant
      t.integer :num_immigrant
      t.boolean :families
      t.integer :num_families
      t.boolean :military
      t.integer :num_military
      t.boolean :homeless
      t.integer :num_homeless
      t.boolean :offender
      t.integer :num_offender
      t.boolean :environment
      t.integer :num_environment
      t.boolean :disabled
      t.integer :num_disabled
      t.boolean :health
      t.integer :num_health
      t.text :purpose
      t.text :population

      t.timestamps
    end
  end
end
