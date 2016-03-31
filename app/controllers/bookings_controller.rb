class BookingsController < ApplicationController
  before_action :set_booking, :only => [ :destroy,:show ,:update]

  def index
    @bookings = Booking.page(params[:page]).per(10)
    # def edit
    if params[:booking_id]
      @booking = Booking.find(params[:booking_id])
      # how to go to the page where i new after i create
    else
      @booking = Booking.new
      # redirect_to bookings_path
      # how to go to the page where i new after i create
    end

    # end
  end
  # def new
  # 	@booking = Booking.new
  # end
  def destroy
    @booking.destroy
    redirect_to bookings_path( :page => params[:page])
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "新增成功"
      redirect_to bookings_path( :page => params[:page])
    else
      render new_booking_path
    end
  end
  # def edit
  # 	@booking = Booking.find(params[:id])
  # end
  def update
    if @booking.update(booking_params)
      flash[:alert] = "修改成功"
      redirect_to bookings_path
    else
      flash[:alert] = "修改失敗"
      redirect_to bookings_path
      # render edit_booking_path why NOT THIS FUNCITON
    end
  end

  private

  def set_booking
     @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :country ,:description ,:age)
  end
end
