class AddStatusToBookings < ActiveRecord::Migration
  def change
  	 add_column :bookings, :description, :text
  	 add_column :bookings, :date , :date
  	 add_column :bookings, :datetime , :datetime
  end
end
