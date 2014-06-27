class CreateConductors < ActiveRecord::Migration
  def change
    create_table :conductors do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
