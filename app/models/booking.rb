class Booking < ActiveRecord::Base
	 validates_presence_of :name , :age , :country , :description
end
