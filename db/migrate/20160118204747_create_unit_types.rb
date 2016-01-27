class CreateUnitTypes < ActiveRecord::Migration
  def change
    create_table :unit_types do |t|
      t.integer :user_id, null: false
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :unit_types, [:name, :user_id], unique: true
  end
end
