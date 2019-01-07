require 'rails_helper'

describe 'User Favorites Locations' do

  it 'user can favorite locations' do

    user = User.create(email: "test@email.com", password: "password", password_confirmation: "password")

    post "/api/v1/favorites?location=denver,co&api_key=#{user.api_key}"

    favorite_json= JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(favorite_json).to be_an_instance_of(Hash)
    expect(favorite_json.keys).to eq ([:location, :api_key])
    expect(favorite_json[:location]).to eq ('denver,co')
    expect(favorite_json[:api_key]).to eq ("#{user.api_key}")
  end
end
