require 'rails_helper'

describe 'User Account Login' do

  it 'user can login into their account via API' do
    user = User.create!(email: "test@email.com", password: "password", password_confirmation: "password")

    post "/api/v1/sessions?email=#{user.email}&password=#{user.password}"

    expect(response).to be_successful

    user_json = JSON.parse(response.body)
    expect(user_json).to include("api_key")

  end
end
