class Api::V1::ForecastController < ApplicationController

  def index
     coordinates = Coordinate.new(params[:location]).coordinates
     lat = coordinates[:lat]
     lng = coordinates[:lng]
     forecast = Forecast.new(lat,lng)
     render json: forecast
  end



end
