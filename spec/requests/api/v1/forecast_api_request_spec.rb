require 'rails_helper'

describe 'internal forecast api' do

  it 'API request is successful' do

    VCR.use_cassette("can send forecast request") do
      get "/api/v1/forecast?location=denver,co"
    end
    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(forecast).to be_an_instance_of(Hash)
  end
end
