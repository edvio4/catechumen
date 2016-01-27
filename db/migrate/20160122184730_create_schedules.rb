class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :user_id, null: false
      t.integer :curriculum_id, null: false
      t.string :pace_id, null: false
      t.string :start_date, null: false

      t.timestamps null: false
    end
    add_index :schedules, [:curriculum_id, :user_id], unique: true
  end
end
