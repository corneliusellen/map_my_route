class FavoritesController < ApplicationController

  def index
    @favorited_stations = Favorite.all
  end

  def create
    favorite = Favorite.new(user_id: params[:user_id], station_id: params[:station_id])
    if favorite.save
      flash.notice = "Station was favorited!"
      redirect_to favorites_path
    else
      render
    end
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to favorites_path
  end
end
