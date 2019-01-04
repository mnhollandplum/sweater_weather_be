class Api::V1::ForecastController < ApplicationController

  def index
     coordinates = GoogleGeolocationService.new.get_coordinates('denver,co')
     lat = coordinates[:lat]
     lng = coordinates[:lng]
     forecast = DarkSkyResultsService.new.get_forecast(lat, lng)
     render json: forecast
  end

end
