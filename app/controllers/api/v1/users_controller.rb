class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 200
    else
      render json: { boo: 'yousuck' }, status: 400
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end