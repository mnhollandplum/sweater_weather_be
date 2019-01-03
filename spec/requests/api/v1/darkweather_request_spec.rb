require 'rails_helper'

describe  do

it 'API request is successful' do

  VCR.use_cassette("can send forecast request") do
    get "/api/v1/forecast?location=denver,co"
  end
  expect(response).to be_successful
end

  it 'exists' do
    VCR.use_cassette("dark sky service") do
    service = DarkSkyResultsService.new
    expect(service).to be_a(DarkSkyResultsService)
    end
  end

  it 'returns weather data' do
    VCR.use_cassette("dark sky service") do
      service = DarkSkyResultsService.new
      expect(service.get_results(39.7392358, -104.990251)).to be_an_instance_of(Hash)
    end
  end
end
