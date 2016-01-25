class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :curriculum_id, null: false
      t.string :unit, null: false
      t.string :division_unit, null: false, default: ""
      t.string :date_completed, null: false, default: ""
      t.boolean :completed, default: false
      t.string :scheduled_date, null: false, default: ""
      t.integer :duration, null: false, default: 0

      t.timestamps null: false
    end
    add_index(:lessons, [:unit, :curriculum_id, :division_unit], unique: true)
  end
end
