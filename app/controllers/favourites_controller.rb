class FavouritesController < ApplicationController

  def index
    @favourites = policy_scope(Favourite)
  end

   def create
    @bike = Bike.find(params[:bike_id])
    @favourite = Favourite.new
    @favourite.bike = @bike
    @favourite.user = current_user
    authorize @favourite
    if @favourite.save
      redirect_to bike_path(@bike)
      flash[:alert] = "Added to favourites"
    else
      render 'bikes/show'
    end
  end
end
