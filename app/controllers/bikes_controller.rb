class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bikes = policy_scope(Bike)
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
    
    if @bike.save
      redirect_to bikes_path, notice: 'Your bike was added!'
    else
      render :new
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :brand, :location, :frame_size, :type)
  end
end
