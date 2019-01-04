require 'rails_helper'

describe 'User Account Login' do

  it 'user can login into their account via API' do
    user = create(:user, email: "test@email.com", password: "password", password_confirmation: "password")
    post "/api/v1/sessions?token=#{user.api_key}"
  end
end
