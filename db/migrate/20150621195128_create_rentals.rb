class CreateRentals < ActiveRecord::Migration
  def change
    create_table :house_rental_requests do |t|
      t.integer :house_id, null: false
      t.integer :user_id, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.string :status, null: false

      t.timestamps
    end

    add_index :house_rental_requests, :house_id
  end
end
