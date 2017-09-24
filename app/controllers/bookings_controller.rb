class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render new_booking_path(@booking)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :email, :phone, :model, :content)
  end
end
