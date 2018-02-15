class SearchesController < ApplicationController

  def new
  end

  def index
    @type = params[:type]
    @zip = params[:zip]
    @stations = Station.where(fuel_type: @type, zip: @zip)
  end

end
