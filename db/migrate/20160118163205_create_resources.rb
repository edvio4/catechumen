class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :units, null: false
      t.integer :unit_type_id, null: false
      t.string :division_units, null: false, default:  ""
      t.integer :division_type_id
      t.integer :subject_id, null: false

      t.timestamps null: false
    end

    add_index :resources, :title, unique: true
  end
end
