require 'rails_helper'

describe 'User List of Favorites Locations' do
  before(:each) do
    @user = User.create(email: "test@email.com", password: "password", password_confirmation: "password")
  end

  it 'user can favorite locations' do
    post "/api/v1/favorites?location=denver,co&api_key=#{@user.api_key}"

    favorite_json= JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(favorite_json).to be_an_instance_of(Hash)
    expect(favorite_json.keys).to eq ([:location, :api_key])
    expect(favorite_json[:location]).to eq ('denver,co')
    expect(favorite_json[:api_key]).to eq ("#{@user.api_key}")
  end

  it 'user cannot create a favorite without a existing api key' do
    post "/api/v1/favorites?location=denver,co&api_key=12345"

    expect(response.status).to eq(401)
  end


  it 'favorites can be listed for user' do
    Favorite.create(user_id: @user.id, location: 'denver,co')
    Favorite.create(user_id: @user.id, location: 'new york,ny')

    get "/api/v1/favorites?api_key=#{@user.api_key}"

    favorite_json= JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(favorite_json).to be_an_instance_of(Hash)
    expect(favorite_json.keys).to eq([:data])
    expect(favorite_json[:data].count).to eq(2)
    expect(favorite_json[:data][0][:attributes].keys).to eq([:location, :current_weather])
  end

  it 'user cannot see a list of favorites without a existing api key' do
    get "/api/v1/favorites?api_key=12345"

    expect(response.status).to eq(401)
  end

  it 'favorites can be deleted' do
    Favorite.create(user_id: @user.id, location: 'denver, co')
    Favorite.create(user_id: @user.id, location: 'new york, ny')

    expect(@user.favorites.count).to eq(2)

    delete "/api/v1/favorites?location=Denver,+CO&api_key=#{@user.api_key}"

    expect(response).to be_successful
    expect(@user.favorites.count).to eq(1)
  end
end
