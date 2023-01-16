class Api::V1::FavoritesController < ApplicationController
  before_action :verify_user
  def create
    @user.favorites.create!(favorites_params)

    render json: SuccessSerializer.favorite_created, status: 201
  end

  private

  def verify_user
    @user = User.find_by(api_key: params[:api_key])

    render json: ErrorSerializer.bad_api_key, status: 401 if @user.nil?
  end

  def favorites_params
    params.permit(:recipe_link, :recipe_title, :country)
  end
end