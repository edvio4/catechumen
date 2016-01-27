class CreateDivisionTypes < ActiveRecord::Migration
  def change
    create_table :division_types do |t|
      t.integer :user_id
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :division_types, [:name, :user_id], unique: true
  end
end
