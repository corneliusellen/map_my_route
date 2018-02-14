class SearchesController < ApplicationController

  def new
  end

  def index
    @stations = Station.where(fuel_type: params[:type], zip: params[:zip])
  end

end
