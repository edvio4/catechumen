class CreateRecurrences < ActiveRecord::Migration
  def change
    create_table :recurrences do |t|
      t.integer :user_id, null: false
      t.integer :schedule_id, null: false
      t.integer :occurrence_id, null: false

      t.timestamps null: false
    end

    add_index :recurrences, [:schedule_id, :occurrence_id, :user_id], unique: true
  end
end
