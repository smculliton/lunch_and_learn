class Api::V1::RecipesController < ApplicationController
  def index
    render json: { thai: 'food' }, status: 200
  end
end