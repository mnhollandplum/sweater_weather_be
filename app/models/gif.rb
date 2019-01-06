class Gif
  def initialize(keywords)
    @keywords = keywords
  end

  def gif_url
    gif_service.get_gifs(@keywords)[:data][:url]
  end

  def gif_service
    GiphyResultsService.new
  end
end
