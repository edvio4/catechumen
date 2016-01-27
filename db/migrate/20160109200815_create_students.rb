class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :students, [:name, :user_id], unique: true
  end
end
