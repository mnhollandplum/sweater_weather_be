class Gif
  def initialize(keywords)
    @keywords = keywords
  end

  def service
    GiphyResultsService.new(@keywords)
  end
end
