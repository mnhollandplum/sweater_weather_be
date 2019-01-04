require 'rails_helper'

describe 'internal gif api' do

  it 'API request is successful' do

    VCR.use_cassette("can send gif and summary request") do
      get "/api/v1/gifs?location=denver,co"
    end
    expect(response).to be_successful
    binding.pry
    gifs = JSON.parse(response.body, symbolize_names: true)
    # expect(forecast).to be_an_instance_of(Hash)
  end
end
