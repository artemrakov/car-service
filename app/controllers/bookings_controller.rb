class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create

  end

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :email, :phone, :model, :content)
  end
end
