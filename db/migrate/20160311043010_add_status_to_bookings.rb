class AddStatusToBookings < ActiveRecord::Migration
  def change
  	 add_column :bookings, :description, :text
  end
end
