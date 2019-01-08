class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: favorite_params[:api_key])
    favorite = Favorite.new(user_id: user.id, location: favorite_params[:location])
    if favorite.save
      render json: {location: favorite.location , api_key: user.api_key}, status: 201
    else
      render json: {message: "Not Authorized"}, status: 401
    end
  end

  def index
    user = User.find_by(api_key: favorite_params[:api_key])
    render json: FavoritesSerializer.new(user.favorites), status: 200
  end

private

  def favorite_params
    params.permit(:location, :api_key)
  end

end
