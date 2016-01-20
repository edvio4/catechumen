class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.integer :resource_id, null: false
      t.integer :student_id, null: false
      t.string :pace
      t.string :date_completed

      t.timestamps null: false
    end
  end
end
