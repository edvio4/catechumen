class CreatePaces < ActiveRecord::Migration
  def change
    create_table :paces do |t|
      t.string :pace, null: false

      t.timestamps null: false
    end
    add_index(:paces, :pace, unique: true)
  end
end
