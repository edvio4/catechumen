class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :curriculum_id, null: false
      t.string :unit, null: false
      t.string :division_unit
      t.string :date_completed
      t.string :scheduled_date

      t.timestamps null: false
    end
  end
end
