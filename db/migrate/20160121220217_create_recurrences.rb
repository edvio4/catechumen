class CreateRecurrences < ActiveRecord::Migration
  def change
    create_table :recurrences do |t|
      t.integer :schedule_id, null: false
      t.integer :day_id, null: false

      t.timestamps null: false
    end

    add_index(:recurrences, [:schedule_id, :day_id], unique: true)
  end
end
