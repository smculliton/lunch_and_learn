class Api::V1::LearningResourcesController < ApplicationController
  before_action :verify_params

  def index
    country = params[:country]

    render json: LearningResourceSerializer.new(LearningResourcesFacade.get_learning_resources(country)), status: 200
  end

  private

  def verify_params
    render json: ErrorSerializer.missing_params('country'), status: 400 unless params[:country]
  end
end