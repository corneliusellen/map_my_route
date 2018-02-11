class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to vehicles_path
    else
      render :new
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :mpg, :fuel)
  end
end
