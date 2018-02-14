class SearchesController < ApplicationController

  def new
  end

  def index
    zip = params[:zip]
    type = params[:type]

    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-API-KEY"] = "JFoTidypmszSMKMU7eFwFgAkQhTE94t3di13d2Vc"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1.json?fuel_type=#{type}&zip=#{zip}")

    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    @search_results = @stations.map do |station|
      Station.new(fuel_type: station[:fuel_type_code], name: station[:station_name], street: station[:street_address], city: station[:city], state: station[:state], zip: station[:zip], hours_operation: station[:access_dats_time])
    end
  end

end
