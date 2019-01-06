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
                            DailyWeather.new(daily_forecast[:data][0][:time], daily_forecast[:data][0][:summary], Gif.new(daily_forecast[:data][0][:summary]).gif_url).to_json,

                            DailyWeather.new(daily_forecast[:data][1][:time], daily_forecast[:data][1][:summary], Gif.new(daily_forecast[:data][1][:summary]).gif_url).to_json,

                            DailyWeather.new(daily_forecast[:data][2][:time], daily_forecast[:data][2][:summary], Gif.new(daily_forecast[:data][2][:summary]).gif_url).to_json,

                            DailyWeather.new(daily_forecast[:data][3][:time], daily_forecast[:data][3][:summary], Gif.new(daily_forecast[:data][3][:summary]).gif_url).to_json,

                            DailyWeather.new(daily_forecast[:data][4][:time], daily_forecast[:data][4][:summary], Gif.new(daily_forecast[:data][4][:summary]).gif_url).to_json
                          ]
              }
                  }
  end




end
