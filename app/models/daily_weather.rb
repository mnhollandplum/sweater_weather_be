class DailyWeather
  require 'json'
  attr_accessor :time, :summary, :gif

  def initialize(time, summary, gif)
    @time = time
    @summary = summary
    @gif = gif
  end

  def as_json(options={})
    {
      time: @time,
      summary: @summary,
      gif: @gif
    }
  end
end
