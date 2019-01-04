class Api::V1::GifsController < ApplicationController

  def index
     coordinates = GoogleGeolocationService.new.get_coordinates('denver,co')
     lat = coordinates[:lat]
     lng = coordinates[:lng]
      daily_forecast = Forecast.new(lat, lng).daily_forecast
        summaries = daily_forecast[:data].map do |key, value|
         key[:summary]
       end

     render json: {
       data: {
         daily_forecasts: [
                            DailyWeather.new(daily_forecast[:data][0][:time], daily_forecast[:data][0][:summary], GiphyResultsService.new.get_gifs(summaries[0]).gif_serv).to_json,

                            DailyWeather.new(daily_forecast[:data][1][:time], daily_forecast[:data][1][:summary], GiphyResultsService.new.get_gifs(summaries[0])).to_json,

                            DailyWeather.new(daily_forecast[:data][2][:time], daily_forecast[:data][2][:summary], GiphyResultsService.new.get_gifs(summaries[0])).to_json,

                            DailyWeather.new(daily_forecast[:data][3][:time], daily_forecast[:data][3][:summary], GiphyResultsService.new.get_gifs(summaries[0])).to_json,

                            DailyWeather.new(daily_forecast[:data][4][:time], daily_forecast[:data][4][:summary], GiphyResultsService.new.get_gifs(summaries[0])).to_json
                          ]
              }
                  }
  end




end
