class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bookings = Booking.all
    authorize(@booking)
  end

  
  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    authorize(@booking)

      if @booking.save
        redirect_to bike_path(@bike), notice: 'Booking was made'
      else
        render "bikes/show"
      end
  end

  private
    def booking_params
      params.require(:booking).permit(:accepted, :dates)
    end
end
