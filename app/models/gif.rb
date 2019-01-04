class Gif
  def initialize(keywords)
    @keywords = keywords
  end

  def find_gifs
  end

  def gif_service
    GiphyResultsService.new
  end
end
