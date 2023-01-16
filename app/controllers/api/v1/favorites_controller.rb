class Api::V1::FavoritesController < ApplicationController
  before_action :verify_api_key, :verify_user
  before_action :verify_favorite_id, :verify_favorite, only: :destroy

  def index
    render json: FavoriteSerializer.new(@user.favorites), status: 200
  end

  def create
    @user.favorites.create!(favorites_params)

    render json: SuccessSerializer.favorite_created, status: 201
  end

  def destroy
    @favorite.destroy

    render status: :no_content
  end

  private

  def verify_api_key
    render json: ErrorSerializer.missing_params('api_key'), status: 400 unless params[:api_key]
  end

  def verify_user
    @user = User.find_by(api_key: params[:api_key])

    render json: ErrorSerializer.bad_api_key, status: 401 unless @user
  end

  def verify_favorite_id
    render json: ErrorSerializer.missing_params('favorite_id'), status: 400 unless params[:favorite_id]
  end

  def verify_favorite
    @favorite = Favorite.find_by(id: params[:favorite_id])

    render json: ErrorSerializer.bad_favorite_id('favorite_id'), status: 401 unless @favorite
  end

  def favorites_params
    params.permit(:recipe_link, :recipe_title, :country)
  end
end