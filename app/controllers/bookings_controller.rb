class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @bike = Bike.find(params[:bike_id])
  end
  
  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @booking
      if @bookmark.save
        redirect_to bike_path(@list)
      else
        render :show
      end
  end

  private
    def bookmark_params
      params.require(:bookmark).permit(:comment, :movie_id)
    end
end
