class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.string :day, null: false

      t.timestamps null: false
    end

    add_index :occurrences, :day, unique: true
  end
end
