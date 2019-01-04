class Api::V1::GifsController < ApplicationController

  def index
     coordinates = GoogleGeolocationService.new.get_coordinates('denver,co')
     lat = coordinates[:lat]
     lng = coordinates[:lng]
     daily_forecast = DarkSkyResultsService.new.get_forecast(lat, lng)[:daily]
     daily_forecast_summary = daily_forecast[:summary]
     # gifs = GiphyResultsService.new.get_gifs(daily_forecast_summary.tr('°', ''))
     render json: {
       data: {
         daily_forecasts: [
                            { time: daily_forecast[:data][0][:time],
                              summary: daily_forecast[:data][0][:summary],
                              # url: gifs[:data][:url]
                            },
                            { time: daily_forecast[:data][1][:time],
                              summary: daily_forecast[:data][1][:summary],
                              # url: gifs[:data][:url]
                            },
                            { time: daily_forecast[:data][2][:time],
                              summary: daily_forecast[:data][2][:summary],
                              # url: gifs[:data][:url]
                            },
                            { time: daily_forecast[:data][3][:time],
                              summary: daily_forecast[:data][3][:summary],
                              # url: gifs[:data][:url]
                            },
                            { time: daily_forecast[:data][4][:time],
                              summary: daily_forecast[:data][4][:summary],
                              # url: gifs[:data][:url]
                            }

                          ]
              }
                  }
  end

end
