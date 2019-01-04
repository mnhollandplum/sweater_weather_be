require 'rails_helper'

describe GiphyResultsService do

  it 'exists' do
    VCR.use_cassette("giphy service") do
      service = GiphyResultsService.new
      expect(service).to be_a(GiphyResultsService)
    end
  end

  it 'returns gif data' do
    VCR.use_cassette("giphyservice") do
      service = GiphyResultsService.new

      expect(service.get_gifs("Cheeseburger")).to be_an_instance_of(Hash)
   end
 end
end
