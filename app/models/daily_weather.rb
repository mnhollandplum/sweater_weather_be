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
end
