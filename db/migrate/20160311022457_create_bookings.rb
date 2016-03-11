class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.text :country
      t.boolean :gender
      t.integer :age

      t.timestamps null: false
    end
  end
end
