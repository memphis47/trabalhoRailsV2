class CreateOrchestras < ActiveRecord::Migration
  def change
    create_table :orchestras do |t|
      t.string :name
      t.string :city
      t.integer :conductor_id

      t.timestamps
    end
  end
end
