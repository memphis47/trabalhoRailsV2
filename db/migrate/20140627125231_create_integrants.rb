class CreateIntegrants < ActiveRecord::Migration
  def change
    create_table :integrants do |t|
      t.string :nome
      t.integer :orchestra_id
      t.integer :instrument_id
      t.integer :conductor_id

      t.timestamps
    end
  end
end
