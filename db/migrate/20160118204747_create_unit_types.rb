class CreateUnitTypes < ActiveRecord::Migration
  def change
    create_table :unit_types do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :unit_types, :name, unique: true
  end
end
