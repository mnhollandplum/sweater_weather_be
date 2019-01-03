require 'rails_helper'

describe DarkSkyResultsService do

it 'exists' do
  VCR.use_cassette("dark sky service") do
  service = DarkSkyResultsService.new
  expect(service).to be_a(DarkSkyResultsService)
  end
end

it 'returns weather data' do
  VCR.use_cassette("dark sky service") do
    service = DarkSkyResultsService.new
    expect(service.get_forecast(39.7392358, -104.990251)).to be_an_instance_of(Hash)
  end
end
end
