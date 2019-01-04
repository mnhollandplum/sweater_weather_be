require 'rails_helper'

describe 'User Account Creation' do

  it 'user can create an account via internal api' do
    post "/api/v1/users", params: {
                                    email: "whatever@example.com",
                                    password: "password",
                                    password_confirmation: "password"
                                  }
    user_json= JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(user_json).to have_key(:api_key)

  end
end
