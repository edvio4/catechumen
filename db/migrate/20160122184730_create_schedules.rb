class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :curriculum_id, null: false
      t.string :pace_id, null: false
      t.string :start_date, null: false

      t.timestamps null: false
    end
    add_index(:schedules, :curriculum_id, unique: true)
  end
end
