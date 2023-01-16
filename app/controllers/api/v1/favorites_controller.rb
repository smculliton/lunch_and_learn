class Api::V1::FavoritesController < ApplicationController
  before_action :verify_params, :verify_user

  def create
    @user.favorites.create!(favorites_params)

    render json: SuccessSerializer.favorite_created, status: 201
  end

  def index
    render json: FavoriteSerializer.new(@user.favorites), status: 200
  end

  private

  def verify_params
    render json: ErrorSerializer.missing_params('api_key'), status: 400 unless params[:api_key]
  end

  def verify_user
    @user = User.find_by(api_key: params[:api_key])

    render json: ErrorSerializer.bad_api_key, status: 401 unless @user
  end

  def favorites_params
    params.permit(:recipe_link, :recipe_title, :country)
  end
end