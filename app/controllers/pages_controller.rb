class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @bikes_featured = Bike.all.sample(1)
  end
end
