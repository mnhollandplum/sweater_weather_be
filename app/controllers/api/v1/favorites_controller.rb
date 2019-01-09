class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: favorite_params[:api_key])
    if user
    favorite = Favorite.create(user_id: user.id, location: favorite_params[:location])
    user.favorites << favorite
      render json: {location: favorite.location , api_key: user.api_key}, status: 201
    else
      render json: {message: "Not Authorized"}, status: 401
    end
  end

  def index
    user = User.find_by(api_key: favorite_params[:api_key])
    if user
      render json: FavoritesSerializer.new(user.favorites), status: 200
    else
      render json: {message: "Not Authorized"}, status: 401
    end

  end

  def destroy
    user = User.find_by(api_key:
    favorite_params[:api_key])
    favorite = Favorite.find_by(user_id: user.id, location: favorite_params[:location].downcase)
    if favorite
     user.favorites.delete(favorite)
      render json: {message: "Favorite deleted"}, status: 204
    elsif !user
      render json: {message: "Not Authorized"}, status: 401
    else
      render json: {message: "No Favorite Location named #{favorite_params[:location]} exists "}, status: 204
    end
  end

private

  def favorite_params
    params.permit(:location, :api_key)
  end

end
