require 'rails_helper'

describe "API request" do

it 'API request is successful' do

    VCR.use_cassette("can send forecast request") do
      get "/api/v1/forecast?location=denver,co"
    end
    expect(response).to be_successful
  end
end
