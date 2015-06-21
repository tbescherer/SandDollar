class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.integer :owner_id
      t.string :address
      t.text :description

      t.timestamps
    end
    add_index :houses, :owner_id
  end
end
