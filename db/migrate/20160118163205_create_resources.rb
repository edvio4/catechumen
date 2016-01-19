class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title, null: false
      t.string :units, null: false
      t.integer :unit_type_id, null: false
      t.string :division_units
      t.string :division_type_id

      t.timestamps null: false
    end
  end
end
