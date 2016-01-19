class CreateDivisionTypes < ActiveRecord::Migration
  def change
    create_table :division_types do |t|
      t.string :name, null: false
    end
  end
end
