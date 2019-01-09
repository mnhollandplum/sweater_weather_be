class Favorite < ApplicationRecord
  belongs_to :user

  def current_weather_summary
    coordinates = Coordinate.new(self.location).coordinates
    forecast = Forecast.new(coordinates[:lat], coordinates[:lng]).current_weather_summary
    forecast
  end
end
