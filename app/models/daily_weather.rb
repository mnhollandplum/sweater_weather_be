class DailyWeather
  require 'json'
  attr_accessor :time, :summary, :gif, :copyright

  def initialize(time, summary, gif, copyright)
    @time = time
    @summary = summary
    @gif = gif
    @copyright = copyright
  end

  def as_json(options={})
    {
      time: @time,
      summary: @summary,
      gif: @gif,
      copyright: @copyright
    }
  end

  def get_coordinates(location)
    Coordinate.new(location).coordinates
  end

  # lat = coordinates[:lat]
  # lng = coordinates[:lng]
  def daily_forecast(lat,lng)
    Forecast.new(lat, lng).daily_forecast
  end

  def daily_forecast_summaries
    daily_forecast[:data].map do |key, value|
      key[:summary]
      end
    end
end
