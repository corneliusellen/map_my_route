class Admin::StationsController < Admin::BaseController

  def index
    @stations = Station.all
  end

  def create
    Station.create!(station_params)
    flash.notice = "Station was saved!"
    redirect_to admin_stations_path
  end

  def destroy
    Station.find(params[:id]).destroy
    redirect_to admin_stations_path
  end

  private

  def station_params
    params.require(:station).permit(:fuel_type, :name, :street, :city, :state, :zip, :hours_operation)
  end
end
