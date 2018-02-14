class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :station

  def find_station
    Station.find(station_id)
  end
end
