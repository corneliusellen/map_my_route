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

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update(vehicle_params)
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :edit
    end
  end

  def destroy
    Vehicle.find(params[:id]).destroy
    redirect_to vehicles_path
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :mpg, :fuel)
  end
end
