require 'rails_helper'

describe 'User Account Creation' do

  it 'user can create an account via internal api' do
    post "/api/v1/users", params: {
                                    email: "whatever@example.com",
                                    password: "password",
                                    password_confirmation: "password"
                                  }
    expect(response.status).to eq(200)
  end
end
