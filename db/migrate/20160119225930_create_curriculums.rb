class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.integer :resource_id, null: false
      t.integer :student_id, null: false
      t.integer :schedule_id
      t.string :date_completed, null: false, default: ""
      t.boolean :completed, default: false

      t.timestamps null: false
    end

    add_index(:curriculums, [:resource_id, :student_id], unique: true)
  end
end
