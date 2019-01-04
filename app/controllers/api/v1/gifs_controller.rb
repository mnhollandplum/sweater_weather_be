class Api::V1::GifsController < ApplicationController

  def index
     coordinates = GoogleGeolocationService.new.get_coordinates('denver,co')
     lat = coordinates[:lat]
     lng = coordinates[:lng]
     daily_forecast = Forecast.new(lat, lng)
     binding.pry
     daily_forecast_summary = daily_forecast[:summary]
     gifs = GiphyResultsService.new.get_gifs(daily_forecast_summary.tr('°', ''))

     render json: {
       data: {
         daily_forecasts: [
                            DailyWeather.new(daily_forecast[:data][0][:time], daily_forecast[:data][0][:summary], "gif").to_json,
                            DailyWeather.new(daily_forecast[:data][1][:time], daily_forecast[:data][1][:summary], "gif").to_json,
                            DailyWeather.new(daily_forecast[:data][2][:time], daily_forecast[:data][2][:summary], "gif").to_json,
                            DailyWeather.new(daily_forecast[:data][3][:time], daily_forecast[:data][3][:summary], "gif").to_json,
                            DailyWeather.new(daily_forecast[:data][4][:time], daily_forecast[:data][4][:summary], "gif").to_json
                          ]
              }
                  }
  end

end
