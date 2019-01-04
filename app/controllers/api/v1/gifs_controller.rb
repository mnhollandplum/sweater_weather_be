class Api::V1::GifsController < ApplicationController

  def index
     coordinates = GoogleGeolocationService.new.get_coordinates('denver,co')
     lat = coordinates[:lat]
     lng = coordinates[:lng]
     forecast = DarkSkyResultsService.new.get_forecast(lat, lng)
     gifs = GiphyResultsService.new.get_gifs(forecast[:daily][:summary][0])

     render json: {
       data: {
         daily_forecasts: [
                            {
                              url: gifs[:data][:url]
                              }
                          ]
              }
                  }
  end

end
