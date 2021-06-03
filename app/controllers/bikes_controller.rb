class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bikes = policy_scope(Bike)
      @markers = @bikes.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        info_window: render_to_string(partial: "info_window", locals: { bike: bike }),
        image_url: helpers.asset_url('bike.jpg')
      }
    end
  end

  def show
    @bike = Bike.find(params[:id])
    authorize(@bike)
  end

  def new
    @bike = Bike.new
    authorize(@bike)
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize(@bike)
    if @bike.save
      redirect_to bikes_path, notice: 'Your bike was added!'
    else
      render :new
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:brand, :location, :frame_size, :bike_type, :description, :photo)
  end
end
