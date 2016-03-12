class BookingsController < ApplicationController
	def index
		@bookings = Booking.page(params[:page]).per(10)
	end
	def new
		@booking = Booking.new
	end
	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
	  	redirect_to bookings_path
	end
	def show
		@booking = Booking.find(params[:id])
	end
	def create
		@booking = Booking.new(booking_params)
		if @booking.save
			flash[:notice] = "新增成功"
			redirect_to bookings_path
		else
			render new_booking_path
		end
	end
	def edit
		@booking = Booking.find(params[:id])
	end
	def update
		@booking = Booking.find(params[:id])
		if @booking.update(booking_params)
			flash[:alert] = "修改成功"
			redirect_to booking_path
		else
			render edit_booking_path
		end
	end

	private
	def booking_params
	  		params.require(:booking).permit(:name, :country ,:description ,:age)
	end
end
